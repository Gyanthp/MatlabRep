function PT2(block, varargin)
% Level2Block: M-Block-Interface template file (wrapper part)
%   Simply substitute all occurances of 'Level2Block' by your
%   block-name and save it under block-name.m
%
%% The setup method is used to set up the basic attributes of the
%  S-function such as ports, parameters, etc.
%

persistent X IDLE   % local states handling for multiple instances

if nargin == 1      % that's the usual way
    setup(block);
else
    switch varargin{1}
      case 'init'   % Initialization
        p = block.DialogPrm(1).Data;
        [~,~,~,~,Xo]=mPT2('init',0,[],[],p);
        if isempty(X)     % first time usage
            new_id=1;
            X{1}=Xo;
            IDLE=[];
        else
            if ~isempty(IDLE)
                new_id=IDLE(1);     % take first idle state slot
                IDLE=IDLE(2:end);   % update idle list
            else
                new_id=length(X)+1; % no idle state slot, so take new one
            end
            X{new_id}=Xo;
        end
    
        block.Dwork(1).Data = new_id;       % store block ID

    case 'output'   % Outputs
        p  = block.DialogPrm(1).Data;
        id = block.Dwork(1).Data;
        t  = block.CurrentTime;
        for i=1:block.NumInputPorts
            u(i) = block.InputPort(i).Data;
        end
        [y,X{id}]=mPT2('output',t,X{id},u',p);
        for i=1:block.NumOutputPorts
            block.OutputPort(i).Data = y(i);
        end

    case 'terminate'   % Terminate
        id = block.Dwork(1).Data;
        t  = block.CurrentTime;
        mPT2('terminate',t,X{id});
        IDLE=[IDLE id];         % mark id as idle state slot

    otherwise % Unexpected flags
        error(['Unhandled M-Block mode = ',varargin{1}]);
    end
end

%endfunction

%% Function: setup ===================================================
%% Abstract:
%%   Set up the basic characteristics of the S-function block such as:
%%   - Input ports
%%   - Output ports
%%   - Dialog parameters
%%   - Options
%%
%%   Required         : Yes
%%   C-Mex counterpart: mdlInitializeSizes
%%
function setup(block)

p = block.DialogPrm(1).Data;
[nu,ny,acc,Ts,~]=mPT2('init',0,[],[],p);   
%                                 ^-- woher t ???

% Register parameters
block.NumDialogPrms     = 1;  % because we use the structure p
block.DialogPrmsTunable = {'Nontunable'};

% Register number of ports
block.NumInputPorts  = nu;
block.NumOutputPorts = ny;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
for i=1:nu
    block.InputPort(i).Dimensions  = 1;
    block.InputPort(i).DataTypeId  = 0;  % double
    block.InputPort(i).Complexity  = 'Real';
    block.InputPort(i).SamplingMode = 'Sample';
    block.InputPort(i).DirectFeedthrough = acc;
end

% Override output port properties
for i=1:ny
    block.OutputPort(i).Dimensions  = 1;
    block.OutputPort(i).DataTypeId  = 0; % double
    block.OutputPort(i).Complexity  = 'Real';
    block.OutputPort(i).SamplingMode = 'Sample';
end

% Register sample times
block.SampleTimes = [Ts 0];

%% Set the block simStateCompliance to default (i.e., same as a built-in block)
block.SimStateCompliance = 'DefaultSimState';

%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------

block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('SetInputPortSamplingMode',@SetSamplingMode);
%block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
%block.RegBlockMethod('Update', @Update);
%block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

%%
%% PostPropagationSetup:
%%   Functionality    : Setup work areas and state variables. Can
%%                      also register run-time methods here
%%   Required         : No
%%   C-Mex counterpart: mdlSetWorkWidths
%%
function DoPostPropSetup(block)

block.NumDworks = 1;
block.Dwork(1).Name = 'xo'; %% state vector or structure
block.Dwork(1).Dimensions      = 1;
block.Dwork(1).DatatypeID      = 0;  % double (used for block ID !!!)
block.Dwork(1).Complexity      = 'real';
block.Dwork(1).UsedAsDiscState = true;


%%
%% InitializeConditions:
%%   Functionality    : Called at the start of simulation and if it is 
%%                      present in an enabled subsystem configured to reset 
%%                      states, it will be called when the enabled subsystem
%%                      restarts execution to reset the states.
%%   Required         : No
%%   C-MEX counterpart: mdlInitializeConditions
%%
function InitializeConditions(block)

PT2(block,'init')
  
%end InitializeConditions


%%
%% Outputs:
%%   Functionality    : Called to generate block outputs in
%%                      simulation step
%%   Required         : Yes
%%   C-MEX counterpart: mdlOutputs
%%
function Outputs(block)

% Do output calculation
PT2(block,'output')

%end Outputs

%%
%% Terminate:
%%   Functionality    : Called at the end of simulation for cleanup
%%   Required         : Yes
%%   C-MEX counterpart: mdlTerminate
%%
function Terminate(block)

PT2(block,'terminate')

%end Terminate
