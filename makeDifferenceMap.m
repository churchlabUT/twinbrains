function diff = makeDifferenceMap(dicom1, dicom2)

if ~exist('dicom1', 'var')
    origdir = pwd;
    [filename1, dirname1] = uigetfile({'*.dcm;*.ima;*.DCM;*.IMA', 'All DICOM Files (*.dcm, *.ima)'}, 'Specify DICOM file . . . ');
    
    if(dirname1 == 0)
        error('User clicked cancel . . .');
    end
    cd(dirname1);
    [filename2, dirname2] = uigetfile({'*.dcm;*.ima;*.DCM;*.IMA', 'All DICOM Files (*.dcm, *.ima)'}, 'Specify DICOM file . . . ');
    
    if(dirname2 == 0)
        error('User clicked cancel . . .');
    end
    cd(origdir);
    dicom1 = [dirname1 filename1];
    dicom2 = [dirname2 filename2];
end

IM1 = dicomread(dicom1);
IM2 = dicomread(dicom2);

diff = abs(IM1-IM2);
imagesc(diff), axis image, set(gca, 'XTick', [], 'YTick', []), colorbar;
title('Magnitude Absolute Difference Map', 'FontSize', 14);
movegui('center');