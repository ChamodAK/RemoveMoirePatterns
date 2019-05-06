clc
clear all
close all

%import the original image and display it

image = imread('scan3.png');
figure; 
imshow(image);
title('Original Image');

%Extract 03 color layers (red, green, blue) from the original image

channel1 = image(:,:,1);
channel2 = image(:,:,2);
channel3 = image(:,:,3);

%Channel 01 Enhancing

[m1, n1] = size(channel1);

img1 = double(channel1);
img1 = img1/(max(max(img1)));

Fimage1 = fft2(img1); 

%shows all frequency peaks of Channel 01

figure
subplot(1,3,1); imshow(((fftshift(abs(Fimage1)))),[0, 500])
title('Spikes in Frequency Domain - Channel 1');

%manupulating noisy pixels of Channel 01

%creating a matrix with all ones with size as same as the image
freqMat1 = ones(m1, n1);

for a = 129:138
    for b = 130:136
        freqMat1(b, a) = 0;
    end
end

for a = 175:184
    for b = 131:136
        freqMat1(b, a) = 0;
    end
end

for a = 130:140
    for b = 181:183
        freqMat1(b, a) = 0;
    end
end

for a = 177:183
    for b = 178:183
        freqMat1(b, a) = 0;
    end
end

for a = 97:104
    for b = 74:78
        freqMat1(b, a) = 0;
    end
end

for a = 208:218
    for b = 76:80
        freqMat1(b, a) = 0;
    end
end

for a = 76:81
    for b = 211:214
        freqMat1(b, a) = 0;
    end
end

for a = 95:105
    for b = 234:238
        freqMat1(b, a) = 0;
    end
end

for a = 210:218
    for b = 235:239
        freqMat1(b, a) = 0;
    end
end

Fimage_modified1 = fftshift(Fimage1).*freqMat1;

% show frequency domain after manupulating noisy pixels of Channel 01

%figure
subplot(1,3,2); imshow(abs(Fimage_modified1),[0, 500])
title('After removing noisy spikes in frequency domain - Channel 1');

% inverse frequency domain back to the normal image of Channel 01

filtered_img1 = ifft2(ifftshift(Fimage_modified1));

%figure
subplot(1,3,3); imshow(filtered_img1)
title('Without noisy patterns - Channel 1');




%Channel 02 Enhancing

[m2, n2] = size(channel2);

img2 = double(channel2);
img2 = img2/(max(max(img2)));

Fimage2 = fft2(img2); 

%shows all frequency peaks of Channel 02

figure
subplot(1,3,1); imshow(((fftshift(abs(Fimage2)))),[0, 500])
title('Spikes in Frequency Domain - Channel 2');

%manupulating noisy pixels of Channel 02

%creating a matrix with all ones with size as same as the image
freqMat2 = ones(m2, n2);

for a = 97:104
    for b = 34:37
        freqMat2(b, a) = 0;
    end
end

for a = 96:104
    for b = 74:79
        freqMat2(b, a) = 0;
    end
end

for a = 130:137
    for b = 129:137
        freqMat2(b, a) = 0;
    end
end

for a = 209:218
    for b = 75:81
        freqMat2(b, a) = 0;
    end
end

for a = 174:184
    for b = 131:136
        freqMat2(b, a) = 0;
    end
end

for a = 95:105
    for b = 233:238
        freqMat2(b, a) = 0;
    end
end

for a = 130:139
    for b = 178:183
        freqMat2(b, a) = 0;
    end
end

for a = 177:183
    for b = 178:183
        freqMat2(b, a) = 0;
    end
end

for a = 210:217
    for b = 235:239
        freqMat2(b, a) = 0;
    end
end


Fimage_modified2 = fftshift(Fimage2).*freqMat2;

% show frequency domain after manupulating noisy pixels of Channel 02

%figure
subplot(1,3,2); imshow(abs(Fimage_modified2),[0, 500])
title('After removing noisy spikes in frequency domain - Channel 2');

% inverse frequency domain back to the normal image of Channel 02

filtered_img2 = ifft2(ifftshift(Fimage_modified2));

%figure
subplot(1,3,3); imshow(filtered_img2)
title('Without noisy patterns - Channel 2');




%Channel 03 Enhancing

[m3, n3] = size(channel3);

img3 = double(channel3);
img3 = img3/(max(max(img3)));

Fimage3 = fft2(img3); 

%shows all frequency peaks of Channel 03

figure
subplot(1,3,1); imshow(((fftshift(abs(Fimage3)))),[0, 500])
title('Spikes in Frequency Domain - Channel 3');

%manupulating noisy pixels of Channel 03

%creating a matrix with all ones with size as same as the image
freqMat3 = ones(m3, n3);

for a = 96:104
    for b = 33:37
        freqMat3(b, a) = 0;
    end
end

for a = 96:104
    for b = 74:77
        freqMat3(b, a) = 0;
    end
end

for a = 131:137
    for b = 79:81
        freqMat3(b, a) = 0;
    end
end

for a = 130:139
    for b = 129:136
        freqMat3(b, a) = 0;
    end
end

for a = 176:180
    for b = 77:80
        freqMat3(b, a) = 0;
    end
end

for a = 209:218
    for b = 75:80
        freqMat3(b, a) = 0;
    end
end

for a = 171:185
    for b = 131:135
        freqMat3(b, a) = 0;
    end
end

for a = 76:80
    for b = 211:215
        freqMat3(b, a) = 0;
    end
end

for a = 96:105
    for b = 234:238
        freqMat3(b, a) = 0;
    end
end

for a = 133:139
    for b = 234:237
        freqMat3(b, a) = 0;
    end
end

for a = 129:140
    for b = 178:183
        freqMat3(b, a) = 0;
    end
end

for a = 175:185
    for b = 177:185
        freqMat3(b, a) = 0;
    end
end

for a = 178:184
    for b = 232:235
        freqMat3(b, a) = 0;
    end
end

for a = 210:218
    for b = 235:239
        freqMat3(b, a) = 0;
    end
end

Fimage_modified3 = fftshift(Fimage3).*freqMat3;

% show frequency domain after manupulating noisy pixels of Channel 03

%figure
subplot(1,3,2); imshow(abs(Fimage_modified3),[0, 500])
title('After removing noisy spikes in frequency domain - Channel 3');

% inverse frequency domain back to the normal image of Channel 03

filtered_img3 = ifft2(ifftshift(Fimage_modified3));

%figure
subplot(1,3,3); imshow(filtered_img3)
title('Without noisy patterns - Channel 3');

%Concatanate all three channels to form the rgb image

concatImg = cat(3,filtered_img1,filtered_img2,filtered_img3);
figure;
imshow(concatImg);
title('Final Output Image');





