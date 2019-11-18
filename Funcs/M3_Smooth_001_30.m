function [truncatedTime, smoothedData] = M3_Smooth_001_30(dataArray, timeArray, segmentWidth);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This user-defined functin will use the moving average method to smooth
% an array of data and return the smoothed array back to the calling
% function. Averages are done sequentially with the width given by user.
%
% Function Call
% [truncatedTime, smoothedData] = M3_Smooth_001_30(dataArray, timeArray, passWidth);
%
% Input Arguments
% dataArray - a one dimensional array containing the data for the product
%             conc. data of an enzyme at a given substrate conc. value.
% timeArray - the time data array. Will be returned at an appropriate length.
% passWidth - the width the function will use to calculate the moving
%             average. Must be an integer > 0 or error will be thrown.
%
% Output Arguments
% truncatedTime - the array of the time elements corresponding to smoothed
%                 data values.
% smoothedData - the array of smoothed data determined through the moving
%                average method.
%
% Assignment Information
%   Assignment:     Milestone 3
%   Team member:    Surya Manikhandan, smanikha@purdue.edu
%                   Julius Mesa, jmesa@purdue.edu
%                   Alex Norkus, anorkus@purdue.edu
%                   Luming Lin, lin971@purdue.edu
%   Team ID:        001-30
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INPUT VALIDATION

inval = 0; % this flag value will hold whether or not any of the params are invalid

if((floor(segmentWidth) ~= segmentWidth) | (segmentWidth <= 0)) % check if width is a positive integer
    fprintf(2, "ERROR: passWidth parameter must be an integer greater than zero\n");
    inval = 1; % toggle flag
end

if(inval) % quit if any parameter is invalid
    return;
end

%% ____________________
%% INITIALIZATION


%% ____________________
%% CALCULATIONS

% initialize parameters needing output to void for now
smoothedData = []; 
truncatedTime = [];

for index = 1:segmentWidth:(length(dataArray) - segmentWidth)
    
    % isolate segment of width from dataset
    dataSegment = dataArray(index : index+segmentWidth);
    timeSegment = timeArray(index: index+segmentWidth);
    
    % sum all elements in the segment
    sumDataSegment = sum(dataSegment);
    sunTimeSegment = sum(timeSegment);
    
    % take average of elements in that array
    avgDataSegment = sumDataSegment / (segmentWidth + 1); 
    avgTimeSegment = sunTimeSegment / (segmentWidth + 1);
    
    % add the averaged val to final output
    smoothedData = [smoothedData, avgDataSegment]; 
    truncatedTime = [truncatedTime, avgTimeSegment];
    
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The function we are submitting
% is our own original work.
end


