%We iterate to obtain 4 different versions changing the luminance of the
% central pixel, conclusions at the end
function compare_luminance(luminance_1,luminance_2,context_lum_1,context_lum_2)

image_v0=zeros(9,18);

for i=1:9
    for j=1:18
        if j<=9
           image_v0(i,j)=context_lum_1;
        else
           image_v0(i,j)=context_lum_2; 
        end
    end
end
image_v0(5,5)=luminance_1;
image_v0(5,14)=luminance_2;


%we use image instead of imshow because you can see in more detail
figure, image(image_v0);
cmap=colormap(gray(256));
title(['CL_1 is ',num2str(context_lum_1),' and CL_2 is ', num2str(context_lum_2)]);

end


