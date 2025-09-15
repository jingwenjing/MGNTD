# MGSNTD
**Please refer to our following paper for algorithm details:**

* Wenjing Jing, Linzhang Lu, Qilong Liu, and Zhen Chen. Multi-graph regularized non-negative Tucker decomposition and its semi-supervised extension for image clustering. 2025.

## Usage
### Installation of Required Toolboxes

** Step 1: Install Image Processing Toolbox**

```matlab
% Check and install Image Processing Toolbox
if ~license('test', 'Image_Toolbox')
    toolboxes = matlab.addons.toolbox.installedToolboxes;
    hasImageToolbox = any(contains({toolboxes.Name}, 'Image Processing Toolbox'));
    
    if ~hasImageToolbox
        disp('Installing Image Processing Toolbox...');
        matlab.addons.install('Image Processing Toolbox');
    end
end
```

**  Step 2: Install Statistics and Machine Learning Toolbox**

```matlab
% Check and install Statistics and Machine Learning Toolbox
if ~license('test', 'Statistics_Toolbox')
    toolboxes = matlab.addons.toolbox.installedToolboxes;
    hasStatsToolbox = any(contains({toolboxes.Name}, 'Statistics and Machine Learning Toolbox'));
    
    if ~hasStatsToolbox
        disp('Installing Statistics and Machine Learning Toolbox...');
        matlab.addons.install('Statistics and Machine Learning Toolbox');
    end
end
```

**  Step 3: Verify Installation**

```matlab
% Verify installation
disp('Verifying toolbox installation:');
fprintf('Image Processing Toolbox: %s\n', string(license('test', 'Image_Toolbox')));
fprintf('Statistics and Machine Learning Toolbox: %s\n', string(license('test', 'Statistics_Toolbox')));
```


### Clone Code Repository

** Step 1: Define Target Folder Path**

```matlab
% Specify target folder path
targetFolder = fullfile(pwd, 'MGNTD');
```

** Step 2: Clone Repository with Git **

```matlab
% Clone repository using git
if ~exist(targetFolder, 'dir')
    disp('Cloning MGNTD repository...');
    if ispc
        system(['git clone https://www.github.com/jingwenjing/MGNTD.git "' targetFolder '"']);
    else
        system(['git clone https://www.github.com/jingwenjing/MGNTD.git ' targetFolder]);
    end
end
```

** Step 3: Alternative ZIP Download (if git fails) **

```matlab
% Fallback: download ZIP file if git is unavailable
if ~exist(targetFolder, 'dir')
    disp('Git not available, attempting to download ZIP file...');
    websave('MGNTD.zip', 'https://github.com/jingwenjing/MGNTD/archive/refs/heads/main.zip');
    unzip('MGNTD.zip');
    movefile('MGNTD-main', 'MGNTD');
    delete('MGNTD.zip');
end
```

** Step 4: Error Handling **

```matlab
% Error handling and final check
if ~exist(targetFolder, 'dir')
    error('Failed to download code. Please manually download and extract to MGNTD folder');
else
    disp('MGNTD folder already exists or successfully created');
end
```



### Extract tensor_toolbox.zip File

** Step 1: Define File Paths **

```matlab
% Define file paths
zipFile = fullfile('MGNTD', 'tensor_toolbox.zip');
targetDir = fullfile('MGNTD', 'tensor_toolbox');
```

** Step 2: Extract ZIP File **

```matlab
% Extract if ZIP exists and target folder doesn't exist
if exist(zipFile, 'file') && ~exist(targetDir, 'dir')
    disp('Extracting tensor_toolbox.zip...');
    unzip(zipFile, fullfile('MGNTD', 'tensor_toolbox'));
    disp('Extraction completed');
end
```

** Step 3: Error Handling and Validation **

```matlab
% Handle missing file or existing folder cases
if ~exist(zipFile, 'file')
    error('tensor_toolbox.zip file not found. Please check MGNTD folder contents');
elseif exist(targetDir, 'dir')
    disp('tensor_toolbox folder already exists');
end
```




### Add Paths and Execute Demo File

** Step 1: Add Main MGNTD Folder to Path **

```matlab
% Add MGNTD folder to MATLAB path
mgntdPath = fullfile(pwd, 'MGNTD');
if exist(mgntdPath, 'dir')
    addpath(mgntdPath);
else
    error('MGNTD folder not found');
end
```

** Step 2: Add Tensor Toolbox Subfolders **

```matlab
% Add tensor_toolbox with all subfolders
tensorToolboxPath = fullfile(mgntdPath, 'tensor_toolbox');
if exist(tensorToolboxPath, 'dir')
    addpath(genpath(tensorToolboxPath));
else
    error('tensor_toolbox folder not found');
end
```

** Step 3: Save Path Settings (Optional) **

```matlab
% Save path settings for future sessions
savepath;
disp('Paths added successfully');
```

** Step 4: Execute Demo File **

```matlab
% Run the demonstration script
demoFile = fullfile(mgntdPath, 'MGSNTD_USPS_demo.m');
if exist(demoFile, 'file')
    disp('Executing MGSNTD_USPS_demo.m...');
    run(demoFile);
else
    error('MGSNTD_USPS_demo.m file not found');
end
```

**Contacts**

For questions about the code or the paper, feel free to contact me by jwj20219@163.com.

