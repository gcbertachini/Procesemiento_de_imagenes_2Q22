[A,map]=imread('mono.bmp');

 w=size(A,1);
 l=size(A,2);
% aux=zeros(w,l);
% aux=A;

% %dividir la imagen en partes (mnultiplo de 4)
% partes=4;
% for k=1:partes;
%     l=mod(k,2);
%     mk{k}=A(l:m,1:end);
% % l=(k+1);
% % m=(2*k)+3;
% % mk{k}=M(l:m,1:end);
% end;
mk=A(1:end/2,1:end/2);
mk_aux=mk;
imshow(A,map);
imshow(mk,map);
imshow(mk_aux,map);

for k=1:l/2-1;
    for m =1:w/2-1;
        if m==1 && k==1
            mk_aux(k,m)=A(2,2)
        elseif m==1
            mk_aux(k,m)=A(2*k+1,2);
        else
            mk_aux(k,m)=A(k*2+1,m*2+1);
        end
    end
end
% for k=10:20
%     A(k,:)=0;
% end
% A(125,:)=0;
% image(A);
% imshow(A,map);
imshow(mk_aux,map);