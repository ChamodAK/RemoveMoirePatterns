clc
clear all
close all

%import the original image and display it

image = imread('scan1.png');
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

for a = 14:31
    for b = 5:31
        freqMat(b, a) = 0;
    end
end

for a = 166:168
    for b = 3:11
        freqMat(b, a) = 0;
    end
end

for a = 175:178
    for b = 53:63
        freqMat(b, a) = 0;
    end
end

for a = 291:296
    for b = 32:42
        freqMat(b, a) = 0;
    end
end

for a = 398:404
    for b = 3:18
        freqMat(b, a) = 0;
    end
end

for a = 407:414
    for b = 52:64
        freqMat(b, a) = 0;
    end
end

for a = 543:553
    for b = 6:25
        freqMat(b, a) = 0;
    end
end

for a = 86:96
    for b = 103:117
        freqMat(b, a) = 0;
    end
end

for a = 163:173
    for b = 81:98
        freqMat(b, a) = 0;
    end
end

for a = 146:150
    for b = 100:116
        freqMat(b, a) = 0;
    end
end

for a = 396:406
    for b = 83:97
        freqMat(b, a) = 0;
    end
end

for a = 436:439
    for b = 102:107
        freqMat(b, a) = 0;
    end
end

for a = 434:437
    for b = 112:116
        freqMat(b, a) = 0;
    end
end

for a = 488:496
    for b = 107:115
        freqMat(b, a) = 0;
    end
end

for a = 53:59
    for b = 175:188
        freqMat(b, a) = 0;
    end
end

for a = 522:528
    for b = 176:189
        freqMat(b, a) = 0;
    end
end

for a = 86:92
    for b = 249:259
        freqMat(b, a) = 0;
    end
end

for a = 138:148
    for b = 248:261
        freqMat(b, a) = 0;
    end
end

for a = 431:434
    for b = 249:261
        freqMat(b, a) = 0;
    end
end

for a = 486:492
    for b = 249:261
        freqMat(b, a) = 0;
    end
end

for a = 172:186
    for b = 267:285
        freqMat(b, a) = 0;
    end
end

for a = 167:174
    for b = 300:311
        freqMat(b, a) = 0;
    end
end

for a = 284:289
    for b = 322:332
        freqMat(b, a) = 0;
    end
end

for a = 409:416
    for b = 270:285
        freqMat(b, a) = 0;
    end
end

for a = 403:406
    for b = 301:312
        freqMat(b, a) = 0;
    end
end

for a = 27:37
    for b = 339:356
        freqMat(b, a) = 0;
    end
end

for a = 176:182
    for b = 349:360
        freqMat(b, a) = 0;
    end
end

for a = 412:414
    for b = 353:360
        freqMat(b, a) = 0;
    end
end

for a = 552:562
    for b = 337:357
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
