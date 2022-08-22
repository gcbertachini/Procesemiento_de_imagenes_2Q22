%get the pixel in the position (2,2) for each group of 16 pixels
function approach1

%read the proposed image
[A,map]=imread('mono.bmp');

 w=size(A,1);
 l=size(A,2);

mk=A(1:end/4,1:end/4);
mat_aux=zeros(l/4,w/4);

imshow(A,map);
figure, imshow(mk,map);


for k=1:l/4-1
    for m =1:w/4-1
        if m==1 && k==1
            mat_aux(k,m)=A(2,2);
        elseif m==1
            mat_aux(k,m)=A(4*(k-1)+2,2);
        elseif k==1
            mat_aux(k,m)=A(2,4*(m-1)+2);
        else
            mat_aux(k,m)=A((k-1)*4+2,(m-1)*4+2);
        end
    end
end


figure, imshow(mat_aux,map);
new_w=size(mat_aux,1);
new_l=size(mat_aux,2);

new_mat_1=zeros(l,w);
new_mat_2=new_mat_1;

for k=1:new_l-1
    for m =1:new_w-1
            new_mat_1=bilineal_interpol(mat_aux(k:k+1,m:m+1),k,m,new_mat_1);
        end
    end

figure, imshow(new_mat_1,map);


end

function new_mat=bilineal_interpol(mat_aux,k,m,new_mat)

aux=zeros(4,4);
for i=1:4
    for j=1:4
        if (i==1 && j==1)
            aux(i,j)=mat_aux(1,1);
        elseif j==1
            aux(i,j)=((5-i)/(5-1))*mat_aux(1,1)+((i-1)/(5-1))*mat_aux(2,1);
        else
            inter_x_1=((5-j)/(5-1))*mat_aux(1,1)+((j-1)/(5-1))*mat_aux(1,2);
            inter_x_2=((5-j)/(5-1))*mat_aux(2,1)+((j-1)/(5-1))*mat_aux(2,2);
            aux(i,j)=((5-i)/(5-1))*inter_x_1+((i-1)/(5-1))*inter_x_2;
        end
    end
end

    if m==1 && k==1
        new_mat(1:4,1:4)=aux;
    elseif m==1
        new_mat(4*(k-1)+1:4*(k-1)+4,1:4)=aux;
    elseif k==1
        new_mat(1:4,4*(m-1)+1:4*(m-1)+4)=aux;
    else
        new_mat(4*(k-1)+1:4*(k-1)+4,4*(m-1)+1:4*(m-1)+4)=aux;
    end


end
