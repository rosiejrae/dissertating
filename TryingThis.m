data = PLF174443sorted;
vars = ["Channel"	"Unit"	"Timestamp"	"Energy"	"Area"	"ISIPrevious"	"ISINext"	"PeakFWHM"	"ValleyFWHM"	"Peak-Valley"];
data.Properties.VariableNames(1:10) = vars;

basalDone = 15 * 60;
burstStimStart = 17 * 60;
burstStimDone = 22 *60;

minBurstISI = 0.08;
maxBurstISI = 0.08;

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

     %basal.PeakEnergy(i) = (basal.PeakValley)/(basal.PeakFWHM);
     %basal.ValleyEnergy(i) = (basal.PeakValley)/(basal.ValleyFwhm);
    basal.ISI(i) = mean(diff(unitdata.Timestamp));
    basal.Firingrate(i) = size(unitdata,1)/basalDone;

end


%% Burst values:

burstvars = ["Unit", "Burst", "StartTime", "StopTime", "Duration", "NumSpikes", "FiringRate", "MeanISI"];
burst = table('Size', [0, length(burstvars)], 'VariableTypes', repmat("double", 1, length(burstvars)), ...
              'VariableNames', burstvars);
for i = 1:length(units)
    
    unitdata = data(data.Unit == units(i) & data.Timestamp > burstStimStart & data.Timestamp < burstStimDone, :);

    figure; stem(unitdata.Timestamp, ones(1,length(unitdata.Timestamp)), 'Color', 'k');
    
    burstIdxs = [];
    for j = 1:size(unitdata,1)
        
        if (j < size(unitdata,1))
            nextISI = unitdata.Timestamp(j+1) - unitdata.Timestamp(j);
        else
            nextISI = Inf;
        end
        if (j > 1)
            prevISI = unitdata.Timestamp(j) - unitdata.Timestamp(j-1);
        else
            prevISI = Inf;
        end

        if ((prevISI > maxBurstISI) && (nextISI < maxBurstISI)) % start of burst
            burstIdxs(end+1,1) = j;
        elseif (prevISI < maxBurstISI && nextISI > maxBurstISI) % end of burst
            burstIdxs(end,2) = j;
        end


    end

    burstIdxs = burstIdxs(diff(burstIdxs,[],2) > 2,:);
    
    for j = 1:size(burstIdxs,1)

        hold on; stem(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2)), ones(1,length(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2)))))

        burst.Unit(end+1) = units(i);
        burst.Burst(end) = j;
        burst.StartTime(end) = unitdata.Timestamp(burstIdxs(j,1));
        burst.StopTime(end) = unitdata.Timestamp(burstIdxs(j,2));
        burst.Duration(end) = burst.StopTime(end) - burst.StartTime(end);
        burst.NumSpikes(end) = burstIdxs(j,2) - burstIdxs(j,1) + 1;
        burst.FiringRate(end) = burst.NumSpikes(end)/burst.Duration(end);
        burst.MeanISI(end) = mean(diff(unitdata.Timestamp(burstIdxs(j,1):burstIdxs(j,2))));
    end

    title(['Unit ', num2str(i)])
end
