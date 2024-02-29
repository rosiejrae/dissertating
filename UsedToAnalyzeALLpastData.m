data = R240209
data = data(~any(isnan(data{:,:}), 2), :);
vars = ["Channel"	"Unit"	"Timestamp"	"Energy"	"Area"	"ISIPrevious"	"ISINext"	"PeakFWHM"	"ValleyFWHM"	"Peak-Valley"];
data.Properties.VariableNames(1:10) = vars;

basalDone = 15 * 60;
burstStimStart = 1 * 60;
burstStimDone = 15 *60;

minBurstISI = 0.08;
maxBurstISI = 0.16;


chans = unique(data.Channel);
units = unique(data.Unit);

chandata = cell(1,length(chans));
for j = 1:length(chans)
    unitdata = cell(1,length(units));
    for i = 1:length(units)
        unitdata{i} = data(data.Channel == chans(j) & data.Unit == units(i),:);
    end
    chandata{j} = unitdata;
end
% to access channel 3, unit 2 table: chandata{3}{2}.Timestamp



chans = unique(data.Channel);
units = unique(data.Unit);

%% Basal values:

basalvars = ["Unit", "Energy", "Area", "PeakFWHM", "ValleyFWHM", "PeakValley", "PeakEnergy", "ValleyEnergy" "ISI", "Firingrate"];
basal = table('Size', [length(units), length(basalvars)], 'VariableTypes', repmat("double", 1, length(basalvars)), ...
              'VariableNames', basalvars);
for i = 1:length(units)

    unitdata = data(data.Unit == units(i) & data.Timestamp < basalDone, :);
    %basal{i,basalvars(1:6)} = mean(unitdata{:,basalvars(1:6)},1);
    
     basal.Unit(i) = mean(unitdata.Unit);
     basal.Energy(i) = mean(unitdata.Energy);
     basal.Area(i) = mean(unitdata.Area);
     basal.PeakFWHM(i) = mean(unitdata.("PeakFWHM"));
     basal.ValleyFWHM(i) = mean(unitdata.('ValleyFWHM'));
     basal.PeakValley(i) = mean(unitdata.('Peak-Valley'));

     if basal.PeakFWHM(i) ~= 0
    basal.PeakEnergy(i) = basal.PeakValley(i) / basal.PeakFWHM(i);
else
    basal.PeakEnergy(i) = NaN;
end

if basal.ValleyFWHM(i) ~= 0
    basal.ValleyEnergy(i) = basal.PeakValley(i) / basal.ValleyFWHM(i);
else
    basal.ValleyEnergy(i) = NaN;
end

    basal.ISI(i) = mean(diff(unitdata.Timestamp));
    basal.Firingrate(i) = size(unitdata,1)/basalDone;

end


%% Burst values:

burstvars = ["Unit", "Burst", "StartTime", "StopTime", "Duration", 'InterBurstinterval', "NumSpikes", "FiringRate", "MeanISI"];
burst = table('Size', [0, length(burstvars)], 'VariableTypes', repmat("double", 1, length(burstvars)), ...
              'VariableNames', burstvars);
for i = 1:length(units)
    
    unitdata = data(data.Unit == units(i) & data.Timestamp > burstStimStart & data.Timestamp < burstStimDone, :);

    figure; stem(unitdata.Timestamp, 100*ones(size(unitdata.Timestamp)), 'k');

            
hold on;
     % Plot line representing the inverse of ISI
    isi_inverse = 1 ./ diff(unitdata.Timestamp);
    plot(unitdata.Timestamp(2:end), isi_inverse, 'b-', 'LineWidth', 2);


   burstIdxs = [];
    inburst = false;
    for j = 1:size(unitdata, 1)
        
        % Previous ISI calculation
        if j > 1
            prevISI = unitdata.Timestamp(j) - unitdata.Timestamp(j-1);
        else
            prevISI = Inf;
        end
        
        % Next ISI calculation
        if j < size(unitdata, 1)
            nextISI = unitdata.Timestamp(j+1) - unitdata.Timestamp(j);
        else
            nextISI = Inf;
        end

        % Burst detection condition
        if (prevISI > minBurstISI) && (nextISI < minBurstISI)
            burstIdxs(end+1, 1) = j;
            inburst = true;
        elseif inburst && (prevISI < maxBurstISI) && (nextISI > maxBurstISI)
            burstIdxs(end, 2) = j;
            inburst = false;
        end
    end

    burstIdxs = burstIdxs(diff(burstIdxs,[],2) > 1,:);
    
    for j = 1:size(burstIdxs,1)

        hold on; stem(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2)), 100* ones(1,length(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2)))))

        burst.Unit(end+1) = units(i);
        burst.Burst(end) = j;
        burst.StartTime(end) = unitdata.Timestamp(burstIdxs(j,1));
        burst.StopTime(end) = unitdata.Timestamp(burstIdxs(j,2));
        burst.Duration(end) = burst.StopTime(end) - burst.StartTime(end);
       
        if j < size(burstIdxs, 1)
    burst.InterBurstinterval(end) = unitdata.Timestamp(burstIdxs(j+1, 1)) - burst.StopTime(end);
else
    burst.InterBurstinterval(end) = NaN;  % Set to NaN if there is no next burst
end

        burst.NumSpikes(end) = burstIdxs(j,2) - burstIdxs(j,1) + 1;
        burst.FiringRate(end) = burst.NumSpikes(end)/burst.Duration(end);
        burst.MeanISI(end) = mean(diff(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2))));
    end

    title(['Unit ', num2str(i)])
    legend('Bursts?', 'Inverse ISI', 'Location', 'Best');
    xlabel('Time sec')
    ylabel('Firing Rate (1/ISI')
end
