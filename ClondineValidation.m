clear
clc
close all

% Open a xls file
% this will bring up the file-open dialog
xlsFile = 'D:\PlexonData\WT Fischers\230910\.8,3.601,8.177 sorted.xls';

format longG % giving the actual values

% Load your data from the Excel file (assuming 'num' is the data matrix)
num = xlsread(xlsFile); % Uncomment this line if 'num' is not defined

% Extract variables from the data
Channel = num(:, 1); % extract the first column of numerical data
Unit = num(:, 2); % extract the second column of numerical data
Timestamp = num(:, 3);
Energy = num(:, 4);
Peak = num(:, 5);
Area = num(:, 6);

% Find the unique values of the unit column
uniqueUnits = unique(Unit);

% Loop through the unique units and extract the corresponding data
for i = 1:length(uniqueUnits)
    % Find the rows corresponding to the current unit
    unitRows = Unit == uniqueUnits(i);

    % Extract the data for the current unit
    unitChannel = Channel(unitRows);
    unitTimestamp = Timestamp(unitRows);
    unitEnergy = Energy(unitRows);
    unitPeak = Peak(unitRows);
    unitArea = Area(unitRows);

    % Calculate the average values for the current unit
    avgEnergy = mean(unitEnergy);
    avgPeak = mean(unitPeak);
    avgArea = mean(unitArea);


   
end

% Print out the total number of unique units
fprintf('Total number of unique units: %d\n', length(uniqueUnits));
 fprintf('Unit %d:\n', uniqueUnits(i));
%___________________________________________________________________________
% Raster plot LC Unit validation from clonidine injection
% Create a figure for the raster plot
figure;
hold on;


% Loop through the unique units and plot the raster for each unit
for i = 1:length(uniqueUnits)
    unitRows = Unit == uniqueUnits(i);
    unitTimestamp = Timestamp(unitRows)/60; %convert to minutes
    unitPeak = Peak(unitRows);
    
 
    % Plot spikes for the current unit
    scatter(unitTimestamp, ones(size(unitTimestamp))*i, 200, unitPeak, 'filled');
end

% Set the x-axis limits to extend the range (adjust these values as needed)
xMin = 0; % Minimum x-axis value
xMax = 5; % total length of recording 

% Set the x-axis limits
xlim([xMin, xMax]);

% Set plot labels and title
xlabel('Time(min)');
ylabel('Unit');
title('Unit Firing Across Time');

% Add a colorbar to indicate peak values
colorbar('eastoutside');

% Calculate suitable color scale limits based on your data
colorMin = min(Peak);
colorMax = max(Peak);
caxis([colorMin, colorMax]);

% Adjust y-axis ticks to show unique unit numbers

yticks(1:length(uniqueUnits));
yticklabels(arrayfun(@num2str, uniqueUnits, 'UniformOutput', false));

% Invert y-axis to have the first unit at the top
set(gca, 'YDir', 'reverse');

% Add a line for clonidine injection  on the X-axis
line([15,15], [1,3], 'Color', 'red', 'LineWidth', 1.5);


% Show the plot
hold off;