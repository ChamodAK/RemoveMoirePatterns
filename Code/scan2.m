clc
clear all
close all

%import the original image and display it

image = imread('scan2.png');
figure; 
imshow(image);
title('Original Image');

%getting width and height of the image in terms of pixels
[m, n] = size(image);

    %frequency domain without enhancing
    %F = fft2(image);
    %S=fftshift(log(1+abs(F)));
    %figure; 
    %imshow(S,[0, 500]);
    %title('Spikes in Frequency Domain');

%convert image to get a more visible fourier transformation by dividing all
%pixels by the pixel which has highest intensity value

img = double(image);
img = img/(max(max(img)));

Fimage = fft2(img); 

%shows all frequency peaks

figure
imshow(((fftshift(abs(Fimage)))),[0, 500])
title('Spikes in Frequency Domain');

%manupulating noisy pixels

%creating a matrix with all ones with size as same as the image
freqMat = ones(m, n);

for a = 68:74
    for b = 25:56
        freqMat(b, a) = 0;
    end
end

for a = 242:249
    for b = 24:60
        freqMat(b, a) = 0;
    end
end

for a = 68:74
    for b = 74:93
        freqMat(b, a) = 0;
    end
end

for a = 242:249
    for b = 73:91
        freqMat(b, a) = 0;
    end
end

for a = 14:22
    for b = 173:187
        freqMat(b, a) = 0;
    end
end

for a = 69:74
    for b = 153:163
        freqMat(b, a) = 0;
    end
end

for a = 244:247
    for b = 154:165
        freqMat(b, a) = 0;
    end
end

for a = 294:302
    for b = 173:184
        freqMat(b, a) = 0;
    end
end

for a = 70:73
    for b = 198:206
        freqMat(b, a) = 0;
    end
end

for a = 242:247
    for b = 200:205
        freqMat(b, a) = 0;
    end
end

for a = 66:75
    for b = 273:287
        freqMat(b, a) = 0;
    end
end

for a = 68:75
    for b = 306:330
        freqMat(b, a) = 0;
    end
end

for a = 242:249
    for b = 270:286
        freqMat(b, a) = 0;
    end
end

for a = 242:249
    for b = 305:327
        freqMat(b, a) = 0;
    end
end

Fimage_modified = fftshift(Fimage).*freqMat;

% show frequency domain after manupulating noisy pixels

figure
imshow(abs(Fimage_modified),[0, 500])
title('After removing noisy spikes in frequency domain');

% inverse frequency domain back to the normal image

filtered_img = ifft2(ifftshift(Fimage_modified));

figure
imshow(filtered_img)
title('Final Output image without noisy patterns');
