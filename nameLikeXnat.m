function nameLikeXnat(dirname, safemode)

getext = @(txt) fliplr(strtok(fliplr(txt), '.'));

if ~(exist('dirname', 'var'))
    dirname = uigetdir(pwd, 'Browse to DICOM directory');
    if dirname == 0
        return;
    end
end

if ~(exist('safemode', 'var'))
    safemode = true;
elseif strcmp(safemode, 'false')
    safemode = false;
else
    safemode = true;
end

d=dir(dirname);

for ii = 3:numel(d)
    if isdicom(d(ii).name)
        hdr = dicominfo(d(ii).name);
        nameString = [hdr.PatientName.FamilyName '.MR.' hdr.RequestedProcedureDescription '.' ...
                      num2str(hdr.SeriesNumber) '.' num2str(hdr.InstanceNumber) '.' hdr.StudyDate '.' ...
                      strtok(hdr.StudyTime, '.') '.' randStr(7) '.dcm'];
        nameString = strrep(nameString, ' ', '_');
        disp(nameString);
        if safemode
            copyfile([dirname '/' d(ii).name], [dirname '/' nameString]);
        else
            movefile([dirname '/' d(ii).name], [dirname '/' nameString]);
        end
    end
end


    function result = isdicom(filename)
        ext = getext(filename);
        if (strcmp(ext, 'dcm') || strcmp(ext, 'DCM') || strcmp(ext, 'ima') || strcmp(ext, 'IMA'))
            result = true;
        else
            result = false;
        end
    end

    function rndStr = randStr(numChar)
        set = char(['a':'z' '0':'9']) ;
        nset = length(set) ;
        setStr = ceil(nset*rand(1,numChar)) ; % with repeat
        rndStr = set(setStr) ;
        
    end

end