function config()
% CONFIG  Creates a global variable config_ that contains
%  constants that have to be shared between scripts.

    global config_;

    % Store base directory of git repository
    [scriptDirectory, ~, ~] = fileparts(mfilename('fullpath'));
    config_.baseDirectory = fullfile(scriptDirectory, '..');

    % Set cache directory (to store intermediate results)
    config_.cacheDirectory = fullfile(config_.baseDirectory, 'cache');
    
    % Participant configuration
    config_.dataDirectory = fullfile(config_.baseDirectory, 'data');
    
    if(exist('config_local', 'file'))
        config_local();
    end    
    
    dataDirectory = config_.dataDirectory;
    
    config_.participants = { ...
        'Mert', '2015-06-09 06.02', fullfile(dataDirectory, 'Subject3');
        'Eric', '2015-06-10 02.52', fullfile(dataDirectory, 'Subject4');
        'Miguel', '2015-06-11 09.37', fullfile(dataDirectory, 'Subject5');
        'NunoL', '2015-06-11 11.05', fullfile(dataDirectory, 'Subject6');
        'Jimmy', '2015-06-11 06.13', fullfile(dataDirectory, 'Subject7');
        'InesV', '2015-06-12 03.40', fullfile(dataDirectory, 'Subject8');
        'Bryan', '2015-06-12 04.57', fullfile(dataDirectory, 'Subject9');
        'Maria', '2015-06-15 03.13', fullfile(dataDirectory, 'Subject10');
        'Robert', '2015-07-08 01.06', fullfile(dataDirectory, 'Subject11');
        'InesCoelho', '2015-07-08 02.28', fullfile(dataDirectory, 'Subject12');
        'MartaCamacho', '2015-07-08 03.38', fullfile(dataDirectory, 'Subject13');
        'JoseM', '2015-07-09 12.28', fullfile(dataDirectory, 'Subject14');
        'G', '2015-07-09 04.32', fullfile(dataDirectory, 'Subject15');
        'Mario', '2015-07-09 05.56', fullfile(dataDirectory, 'Subject16');
        'VC', '2015-07-15 08.08', fullfile(dataDirectory, 'Subject17');
        'RF', '2015-07-15 09.56', fullfile(dataDirectory, 'Subject18');
        '19', '2015-07-15 04.31', fullfile(dataDirectory, 'Subject19');
        };
    
    config_.conditionsShort = { ...
        'Trn', 'NG0', 'NG5', 'NG10', 'G0', 'G5', 'G10'};

    config_.questions = { ...
        '"looking at my own hand, not a VH"', ...
        '"virtual hand was my hand"', ...
        '"virtual hand belonged to me "', ...
        '"virtual hand was part of my body"', ...
        '"physically resembling my hand"', ...
        '"my real hand was turning virtual"',  ...
        '"I could control the virtual hand"', ...
        '"virtual movements were caused by me"', ...
        '"my movement turned the lights off"', ...
        '"focussing only on the virtual hand"', ...
        '"the virtual hand was controlling mine"', ...
        '"virtual hand caused the movement of mine"', ...
        '"my hand was located where the VH was"',...
        '"my hand moved where the VH moved"'};    
