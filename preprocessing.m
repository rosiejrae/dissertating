data = PDF184078sorted;
data = data(~any(isnan(data{:,:}), 2), :);
data = removevars(data, "ISIPrevious");
data = removevars(data, "ISINext");
animalNum = 184078;
estrusPhase = 'P';
lightCycle = 'D';

% Convert character arrays to cell arrays
estrusPhase = cellstr(estrusPhase);
lightCycle = cellstr(lightCycle);

% Add new columns with repeated values
data.animalNum = repmat(animalNum, height(data), 1);
data.estrusPhase = repmat(estrusPhase, height(data), 1);
data.lightCycle = repmat(lightCycle, height(data), 1);

data.unitType = strings(height(data), 1);  % Initialize the new column with empty strings

% Set the new column based on conditions on the Unit column
data.unitType(data.Unit == 1) = 'LC';
data.unitType(data.Unit == 2) = 'LC';
data.unitType(data.Unit == 3) = 'LC';





