data = BasalBurstAverages(:, ["AnimalNum" "UnitNum" "unitType" "Estrus" "LightCycle" "Burst" "Duration" "InterburstInterval" "NumSpikes" "FiringRate" "ISIinBurst"]);
data(1,:) = [];
data = sortrows(data, "unitType");


unitTypeCell = string(data.unitType);    % Convert the 'unitType' column to a cell array of strings
unitType = unique(unitTypeCell);    % Get unique values from the 'unitType' column
unitTypegroups = cell(length(unitType), 1);    % Create a cell array to store the groups

% Loop through to separate unit type
for i = 1:length(unitType)
    rows = strcmp(unitTypeCell, unitType(i));    % Find the rows with the current string 
    unitTypegroups{i} = data(rows, :);   % Store the rows in the corresponding group
end

Interneurons= unitTypegroups{1};
    estrusPhaseCell = string(Interneurons.Estrus);
    estrusPhase = unique(estrusPhaseCell);
    estrusphaseGroups = cell(length(estrusPhase),1);
 for i = 1:length(estrusPhase)
     rows = strcmp(estrusPhaseCell, estrusPhase(i));
     estrusphaseGroups{i} = Interneurons(rows,:);
 end
        InMale = estrusphaseGroups{1};
        InPFem = estrusphaseGroups{2};

NaNeurons = unitTypegroups{2};
estrusPhaseCell = string(NaNeurons.Estrus);
    estrusPhase = unique(estrusPhaseCell);
    estrusphaseGroups = cell(length(estrusPhase),1);
 for i = 1:length(estrusPhase)
     rows = strcmp(estrusPhaseCell, estrusPhase(i));
     estrusphaseGroups{i} = NaNeurons(rows,:);
 end
        NaDFem = estrusphaseGroups{1};
        NaMale = estrusphaseGroups{2};
        NaPFem = estrusphaseGroups{3};

BBInMales = InMale;
BBInPFem = InPFem;
BBNaDFem = NaDFem;
BBNaMale = NaMale;
BBNaPFem = NaPFem;



%Evoked Bursts
data = EvokedBurstAverages(:, ["AnimalNum" "UnitNum" "unitType" "Estrus" "LightCycle" "Burst" "Duration" "InterburstInterval" "NumSpikes" "FiringRate" "ISIinBurst"]);
data(1,:) = [];
data = sortrows(data, "unitType");


unitTypeCell = string(data.unitType);    % Convert the 'unitType' column to a cell array of strings
unitType = unique(unitTypeCell);    % Get unique values from the 'unitType' column
unitTypegroups = cell(length(unitType), 1);    % Create a cell array to store the groups

% Loop through to separate unit type
for i = 1:length(unitType)
    rows = strcmp(unitTypeCell, unitType(i));    % Find the rows with the current string 
    unitTypegroups{i} = data(rows, :);   % Store the rows in the corresponding group
end

Interneurons= unitTypegroups{1};
    estrusPhaseCell = string(Interneurons.Estrus);
    estrusPhase = unique(estrusPhaseCell);
    estrusphaseGroups = cell(length(estrusPhase),1);
 for i = 1:length(estrusPhase)
     rows = strcmp(estrusPhaseCell, estrusPhase(i));
     estrusphaseGroups{i} = Interneurons(rows,:);
 end
        InMale = estrusphaseGroups{1};
        InPFem = estrusphaseGroups{2};

NaNeurons = unitTypegroups{2};
estrusPhaseCell = string(NaNeurons.Estrus);
    estrusPhase = unique(estrusPhaseCell);
    estrusphaseGroups = cell(length(estrusPhase),1);
 for i = 1:length(estrusPhase)
     rows = strcmp(estrusPhaseCell, estrusPhase(i));
     estrusphaseGroups{i} = NaNeurons(rows,:);
 end
        NaDFem = estrusphaseGroups{1};
        NaMale = estrusphaseGroups{2};
        NaPFem = estrusphaseGroups{3};

EBInMales = InMale;
EBInPFem = InPFem;
EBNaDFem = NaDFem;
EBNaMale = NaMale;
EBNaPFem = NaPFem;


%BurstNumFig
bar(1, median(BBInMales.Burst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.Burst)), BBInMales.Burst, 'r.');  % Individual points
text(1, mean(BBInMales.Burst) + max(BBInMales.Burst)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.Burst), length(BBInMales.Burst)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.Burst)), BBNaMale.Burst, 'k.');  % Individual points
text(1, mean(BBNaMale.Burst) + max(BBNaMale.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.Burst), length(BBNaMale.Burst)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.Burst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.Burst)), BBInPFem.Burst, 'r.');  % Individual points
text(2, mean(BBInPFem.Burst) + max(BBInPFem.Burst)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.Burst), length(BBInPFem.Burst)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.Burst)), BBNaPFem.Burst, 'k.');  % Individual points
text(2, mean(BBNaPFem.Burst) + max(BBNaPFem.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.Burst), length(BBNaPFem.Burst)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.Burst)), BBNaDFem.Burst, 'k.');  % Individual points
text(3, mean(BBNaDFem.Burst) + max(BBNaDFem.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.Burst), length(BBNaDFem.Burst)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.Burst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.Burst)), EBInMales.Burst, 'r.');  % Individual points
text(4, mean(EBInMales.Burst) + max(EBInMales.Burst)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.Burst), length(EBInMales.Burst)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.Burst)), EBNaMale.Burst, 'k.');  % Individual points
text(4, mean(EBNaMale.Burst) + max(EBNaMale.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.Burst), length(EBNaMale.Burst)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.Burst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.Burst)), EBInPFem.Burst, 'r.');  % Individual points
text(5, mean(EBInPFem.Burst) + max(EBInPFem.Burst)*1, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.Burst), length(EBInPFem.Burst)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.Burst)), EBNaPFem.Burst, 'k.');  % Individual points
text(5, mean(EBNaPFem.Burst) + max(EBNaPFem.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.Burst), length(EBNaPFem.Burst)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.Burst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.Burst)), EBNaDFem.Burst, 'k.');  % Individual points
text(6, mean(EBNaDFem.Burst) + max(EBNaDFem.Burst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.Burst), length(EBNaDFem.Burst)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('BurstNum');
ylabel('Number');

hold off;


%BurstDuration
bar(1, median(BBInMales.Duration), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.Duration)), BBInMales.Duration, 'r.');  % Individual points
text(1, mean(BBInMales.Duration) + max(BBInMales.Duration)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.Duration), length(BBInMales.Duration)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.Duration)), BBNaMale.Duration, 'k.');  % Individual points
text(1, mean(BBNaMale.Duration) + max(BBNaMale.Duration)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.Duration), length(BBNaMale.Duration)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.Duration), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.Duration)), BBInPFem.Duration, 'r.');  % Individual points
text(2, mean(BBInPFem.Duration) + max(BBInPFem.Duration)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.Duration), length(BBInPFem.Duration)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.Duration)), BBNaPFem.Duration, 'k.');  % Individual points
text(2, mean(BBNaPFem.Duration) + max(BBNaPFem.Duration)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.Duration), length(BBNaPFem.Duration)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.Duration)), BBNaDFem.Duration, 'k.');  % Individual points
text(3, mean(BBNaDFem.Duration) + max(BBNaDFem.Duration)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.Duration), length(BBNaDFem.Duration)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.Duration), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.Duration)), EBInMales.Duration, 'r.');  % Individual points
text(4, mean(EBInMales.Duration) + max(EBInMales.Duration)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.Duration), length(EBInMales.Duration)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.Duration)), EBNaMale.Duration, 'k.');  % Individual points
text(4, mean(EBNaMale.Duration) + max(EBNaMale.Duration)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.Duration), length(EBNaMale.Duration)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.Duration), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.Duration)), EBInPFem.Duration, 'r.');  % Individual points
text(5, mean(EBInPFem.Duration) + max(EBInPFem.Duration)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.Duration), length(EBInPFem.Duration)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.Duration)), EBNaPFem.Duration, 'k.');  % Individual points
text(5, mean(EBNaPFem.Duration) + max(EBNaPFem.Duration)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.Duration), length(EBNaPFem.Duration)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.Duration),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.Duration)), EBNaDFem.Duration, 'k.');  % Individual points
text(6, mean(EBNaDFem.Duration) + max(EBNaDFem.Duration)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.Duration), length(EBNaDFem.Duration)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('BurstDuration');
ylabel('Duration(s)');

hold off;


%InterburstInterval
bar(1, median(BBInMales.InterburstInterval), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.InterburstInterval)), BBInMales.InterburstInterval, 'r.');  % Individual points
text(1, mean(BBInMales.InterburstInterval) + max(BBInMales.InterburstInterval)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.InterburstInterval), length(BBInMales.InterburstInterval)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.InterburstInterval)), BBNaMale.InterburstInterval, 'k.');  % Individual points
text(1, mean(BBNaMale.InterburstInterval) + max(BBNaMale.InterburstInterval)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.InterburstInterval), length(BBNaMale.InterburstInterval)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.InterburstInterval), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.InterburstInterval)), BBInPFem.InterburstInterval, 'r.');  % Individual points
text(2, mean(BBInPFem.InterburstInterval) + max(BBInPFem.InterburstInterval)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.InterburstInterval), length(BBInPFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.InterburstInterval)), BBNaPFem.InterburstInterval, 'k.');  % Individual points
text(2, mean(BBNaPFem.InterburstInterval) + max(BBNaPFem.InterburstInterval)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.InterburstInterval), length(BBNaPFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.InterburstInterval)), BBNaDFem.InterburstInterval, 'k.');  % Individual points
text(3, mean(BBNaDFem.InterburstInterval) + max(BBNaDFem.InterburstInterval)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.InterburstInterval), length(BBNaDFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.InterburstInterval), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.InterburstInterval)), EBInMales.InterburstInterval, 'r.');  % Individual points
text(4, mean(EBInMales.InterburstInterval) + max(EBInMales.InterburstInterval)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.InterburstInterval), length(EBInMales.InterburstInterval)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.InterburstInterval)), EBNaMale.InterburstInterval, 'k.');  % Individual points
text(4, mean(EBNaMale.InterburstInterval) + max(EBNaMale.InterburstInterval)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.InterburstInterval), length(EBNaMale.InterburstInterval)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.InterburstInterval), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.InterburstInterval)), EBInPFem.InterburstInterval, 'r.');  % Individual points
text(5, mean(EBInPFem.InterburstInterval) + max(EBInPFem.InterburstInterval)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.InterburstInterval), length(EBInPFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.InterburstInterval)), EBNaPFem.InterburstInterval, 'k.');  % Individual points
text(5, mean(EBNaPFem.InterburstInterval) + max(EBNaPFem.InterburstInterval)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.InterburstInterval), length(EBNaPFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.InterburstInterval),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.InterburstInterval)), EBNaDFem.InterburstInterval, 'k.');  % Individual points
text(6, mean(EBNaDFem.InterburstInterval) + max(EBNaDFem.InterburstInterval)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.InterburstInterval), length(EBNaDFem.InterburstInterval)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('InterburstInterval');
ylabel('InterburstInterval(s)');

hold off;






bar(1, median(BBInMales.NumSpikes), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.NumSpikes)), BBInMales.NumSpikes, 'r.');  % Individual points
text(1, mean(BBInMales.NumSpikes) + max(BBInMales.NumSpikes)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.NumSpikes), length(BBInMales.NumSpikes)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.NumSpikes)), BBNaMale.NumSpikes, 'k.');  % Individual points
text(1, mean(BBNaMale.NumSpikes) + max(BBNaMale.NumSpikes)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.NumSpikes), length(BBNaMale.NumSpikes)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.NumSpikes), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.NumSpikes)), BBInPFem.NumSpikes, 'r.');  % Individual points
text(2, mean(BBInPFem.NumSpikes) + max(BBInPFem.NumSpikes)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.NumSpikes), length(BBInPFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.NumSpikes)), BBNaPFem.NumSpikes, 'k.');  % Individual points
text(2, mean(BBNaPFem.NumSpikes) + max(BBNaPFem.NumSpikes)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.NumSpikes), length(BBNaPFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.NumSpikes)), BBNaDFem.NumSpikes, 'k.');  % Individual points
text(3, mean(BBNaDFem.NumSpikes) + max(BBNaDFem.NumSpikes)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.NumSpikes), length(BBNaDFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.NumSpikes), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.NumSpikes)), EBInMales.NumSpikes, 'r.');  % Individual points
text(4, mean(EBInMales.NumSpikes) + max(EBInMales.NumSpikes)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.NumSpikes), length(EBInMales.NumSpikes)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.NumSpikes)), EBNaMale.NumSpikes, 'k.');  % Individual points
text(4, mean(EBNaMale.NumSpikes) + max(EBNaMale.NumSpikes)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.NumSpikes), length(EBNaMale.NumSpikes)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.NumSpikes), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.NumSpikes)), EBInPFem.NumSpikes, 'r.');  % Individual points
text(5, mean(EBInPFem.NumSpikes) + max(EBInPFem.NumSpikes)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.NumSpikes), length(EBInPFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.NumSpikes)), EBNaPFem.NumSpikes, 'k.');  % Individual points
text(5, mean(EBNaPFem.NumSpikes) + max(EBNaPFem.NumSpikes)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.NumSpikes), length(EBNaPFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.NumSpikes),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.NumSpikes)), EBNaDFem.NumSpikes, 'k.');  % Individual points
text(6, mean(EBNaDFem.NumSpikes) + max(EBNaDFem.NumSpikes)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.NumSpikes), length(EBNaDFem.NumSpikes)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('SpikesInBurst');
ylabel('SpikesInBurst');

hold off;

%Firingrat
bar(1, median(BBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.FiringRate)), BBInMales.FiringRate, 'r.');  % Individual points
text(1, mean(BBInMales.FiringRate) + max(BBInMales.FiringRate)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.FiringRate), length(BBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.FiringRate)), BBNaMale.FiringRate, 'k.');  % Individual points
text(1, mean(BBNaMale.FiringRate) + max(BBNaMale.FiringRate)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.FiringRate), length(BBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.FiringRate)), BBInPFem.FiringRate, 'r.');  % Individual points
text(2, mean(BBInPFem.FiringRate) + max(BBInPFem.FiringRate)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.FiringRate), length(BBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.FiringRate)), BBNaPFem.FiringRate, 'k.');  % Individual points
text(2, mean(BBNaPFem.FiringRate) + max(BBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.FiringRate), length(BBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.FiringRate)), BBNaDFem.FiringRate, 'k.');  % Individual points
text(3, mean(BBNaDFem.FiringRate) + max(BBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.FiringRate), length(BBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.FiringRate)), EBInMales.FiringRate, 'r.');  % Individual points
text(4, mean(EBInMales.FiringRate) + max(EBInMales.FiringRate)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.FiringRate), length(EBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.FiringRate)), EBNaMale.FiringRate, 'k.');  % Individual points
text(4, mean(EBNaMale.FiringRate) + max(EBNaMale.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.FiringRate), length(EBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.FiringRate)), EBInPFem.FiringRate, 'r.');  % Individual points
text(5, mean(EBInPFem.FiringRate) + max(EBInPFem.FiringRate)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.FiringRate), length(EBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.FiringRate)), EBNaPFem.FiringRate, 'k.');  % Individual points
text(5, mean(EBNaPFem.FiringRate) + max(EBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.FiringRate), length(EBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.FiringRate)), EBNaDFem.FiringRate, 'k.');  % Individual points
text(6, mean(EBNaDFem.FiringRate) + max(EBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.FiringRate), length(EBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('FiringRate');
ylabel('FiringRate(Hz)');

hold off;%Firingrat
bar(1, median(BBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.FiringRate)), BBInMales.FiringRate, 'r.');  % Individual points
text(1, mean(BBInMales.FiringRate) + max(BBInMales.FiringRate)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.FiringRate), length(BBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.FiringRate)), BBNaMale.FiringRate, 'k.');  % Individual points
text(1, mean(BBNaMale.FiringRate) + max(BBNaMale.FiringRate)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.FiringRate), length(BBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.FiringRate)), BBInPFem.FiringRate, 'r.');  % Individual points
text(2, mean(BBInPFem.FiringRate) + max(BBInPFem.FiringRate)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.FiringRate), length(BBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.FiringRate)), BBNaPFem.FiringRate, 'k.');  % Individual points
text(2, mean(BBNaPFem.FiringRate) + max(BBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.FiringRate), length(BBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.FiringRate)), BBNaDFem.FiringRate, 'k.');  % Individual points
text(3, mean(BBNaDFem.FiringRate) + max(BBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.FiringRate), length(BBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.FiringRate)), EBInMales.FiringRate, 'r.');  % Individual points
text(4, mean(EBInMales.FiringRate) + max(EBInMales.FiringRate)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.FiringRate), length(EBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.FiringRate)), EBNaMale.FiringRate, 'k.');  % Individual points
text(4, mean(EBNaMale.FiringRate) + max(EBNaMale.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.FiringRate), length(EBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.FiringRate)), EBInPFem.FiringRate, 'r.');  % Individual points
text(5, mean(EBInPFem.FiringRate) + max(EBInPFem.FiringRate)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.FiringRate), length(EBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.FiringRate)), EBNaPFem.FiringRate, 'k.');  % Individual points
text(5, mean(EBNaPFem.FiringRate) + max(EBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.FiringRate), length(EBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.FiringRate)), EBNaDFem.FiringRate, 'k.');  % Individual points
text(6, mean(EBNaDFem.FiringRate) + max(EBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.FiringRate), length(EBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('FiringRate');
ylabel('FiringRate(Hz)');

hold off;








%Firingrate
bar(1, median(BBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.FiringRate)), BBInMales.FiringRate, 'r.');  % Individual points
text(1, mean(BBInMales.FiringRate) + max(BBInMales.FiringRate)*0.05, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.FiringRate), length(BBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.FiringRate)), BBNaMale.FiringRate, 'k.');  % Individual points
text(1, mean(BBNaMale.FiringRate) + max(BBNaMale.FiringRate)*1, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.FiringRate), length(BBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.FiringRate)), BBInPFem.FiringRate, 'r.');  % Individual points
text(2, mean(BBInPFem.FiringRate) + max(BBInPFem.FiringRate)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.FiringRate), length(BBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.FiringRate)), BBNaPFem.FiringRate, 'k.');  % Individual points
text(2, mean(BBNaPFem.FiringRate) + max(BBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.FiringRate), length(BBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.FiringRate)), BBNaDFem.FiringRate, 'k.');  % Individual points
text(3, mean(BBNaDFem.FiringRate) + max(BBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.FiringRate), length(BBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.FiringRate)), EBInMales.FiringRate, 'r.');  % Individual points
text(4, mean(EBInMales.FiringRate) + max(EBInMales.FiringRate)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.FiringRate), length(EBInMales.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.FiringRate)), EBNaMale.FiringRate, 'k.');  % Individual points
text(4, mean(EBNaMale.FiringRate) + max(EBNaMale.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.FiringRate), length(EBNaMale.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.FiringRate), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.FiringRate)), EBInPFem.FiringRate, 'r.');  % Individual points
text(5, mean(EBInPFem.FiringRate) + max(EBInPFem.FiringRate)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.FiringRate), length(EBInPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.FiringRate)), EBNaPFem.FiringRate, 'k.');  % Individual points
text(5, mean(EBNaPFem.FiringRate) + max(EBNaPFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.FiringRate), length(EBNaPFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.FiringRate),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.FiringRate)), EBNaDFem.FiringRate, 'k.');  % Individual points
text(6, mean(EBNaDFem.FiringRate) + max(EBNaDFem.FiringRate)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.FiringRate), length(EBNaDFem.FiringRate)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('FiringRate');
ylabel('FiringRate(Hz)');

hold off;





%BurstISI
bar(1, median(BBInMales.ISIinBurst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(ones(size(BBInMales.ISIinBurst)), BBInMales.ISIinBurst, 'r.');  % Individual points
text(1, mean(BBInMales.ISIinBurst) + max(BBInMales.ISIinBurst)*0.01, ...
    sprintf('In Med: %.2f\nn = %d', median(BBInMales.ISIinBurst), length(BBInMales.ISIinBurst)), ...
    'HorizontalAlignment', 'center');
bar(1, median(BBNaMale.ISIinBurst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(ones(size(BBNaMale.ISIinBurst)), BBNaMale.ISIinBurst, 'k.');  % Individual points
text(1, mean(BBNaMale.ISIinBurst) + max(BBNaMale.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaMale.ISIinBurst), length(BBNaMale.ISIinBurst)), ...
    'HorizontalAlignment', 'center');


bar(2, median(BBInPFem.ISIinBurst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(2*ones(size(BBInPFem.ISIinBurst)), BBInPFem.ISIinBurst, 'r.');  % Individual points
text(2, mean(BBInPFem.ISIinBurst) + max(BBInPFem.ISIinBurst)*2, ...
    sprintf('Int Med: %.2f\nn = %d', median(BBInPFem.ISIinBurst), length(BBInPFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');
bar(2, median(BBNaPFem.ISIinBurst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(2*ones(size(BBNaPFem.ISIinBurst)), BBNaPFem.ISIinBurst, 'k.');  % Individual points
text(2, mean(BBNaPFem.ISIinBurst) + max(BBNaPFem.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaPFem.ISIinBurst), length(BBNaPFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');


bar(3, median(BBNaDFem.ISIinBurst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(3*ones(size(BBNaDFem.ISIinBurst)), BBNaDFem.ISIinBurst, 'k.');  % Individual points
text(3, mean(BBNaDFem.ISIinBurst) + max(BBNaDFem.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(BBNaDFem.ISIinBurst), length(BBNaDFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');

bar(4, median(EBInMales.ISIinBurst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(4*ones(size(EBInMales.ISIinBurst)), EBInMales.ISIinBurst, 'r.');  % Individual points
text(4, mean(EBInMales.ISIinBurst) + max(EBInMales.ISIinBurst)*0.05, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInMales.ISIinBurst), length(EBInMales.ISIinBurst)), ...
    'HorizontalAlignment', 'center');
bar(4, median(EBNaMale.ISIinBurst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(4*ones(size(EBNaMale.ISIinBurst)), EBNaMale.ISIinBurst, 'k.');  % Individual points
text(4, mean(EBNaMale.ISIinBurst) + max(EBNaMale.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaMale.ISIinBurst), length(EBNaMale.ISIinBurst)), ...
    'HorizontalAlignment', 'center');


bar(5, median(EBInPFem.ISIinBurst), 'FaceColor', [0.7, 0.7, 0.7]);  % Bar for mean value
hold on;
scatter(5*ones(size(EBInPFem.ISIinBurst)), EBInPFem.ISIinBurst, 'r.');  % Individual points
text(5, mean(EBInPFem.ISIinBurst) + max(EBInPFem.ISIinBurst)*02, ...
    sprintf('Int Med: %.2f\nn = %d', median(EBInPFem.ISIinBurst), length(EBInPFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');
bar(5, median(EBNaPFem.ISIinBurst),  'FaceColor', [0.7, 0.9, 1.0], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(5*ones(size(EBNaPFem.ISIinBurst)), EBNaPFem.ISIinBurst, 'k.');  % Individual points
text(5, mean(EBNaPFem.ISIinBurst) + max(EBNaPFem.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaPFem.ISIinBurst), length(EBNaPFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');


bar(6, median(EBNaDFem.ISIinBurst),  'FaceColor', [1.0, 0.7, 0.7], 'BarWidth', 0.5);  % Bar for mean value
hold on;
scatter(6*ones(size(EBNaDFem.ISIinBurst)), EBNaDFem.ISIinBurst, 'k.');  % Individual points
text(6, mean(EBNaDFem.ISIinBurst) + max(EBNaDFem.ISIinBurst)*0.05, ...
    sprintf('Na Med: %.2f\nn = %d', median(EBNaDFem.ISIinBurst), length(EBNaDFem.ISIinBurst)), ...
    'HorizontalAlignment', 'center');


xticks([1 2 3 4 5 6]);  % Set the x-axis ticks
xticklabels({'BasalBurstsMales(15)' 'BasalBurstsProFem(15)' 'BasalBurstsDieFem(15)' 'EvokedBurstsMales(5)' 'EvokedBurstsProFem(5)'  'EvokedBurstsDieFem(5)'});  % Set the labels for the x-axis ticks

title('BurstISI');
ylabel('BurstISI (s)');

hold off;
