function F = userfilter(A, f)
[l,w,c] = size(A)
F = zeros(size(A));
nx = floor(length(f(1,:))/2);
ny = floor(length(f(:,1))/2);
F(:,1:ny,:) = A(:,1:ny,:); %Set Borders to original
F(:,end-ny:end,:) = A(:,end-ny:end,:);
F(1:nx,:,:) = A(1:nx,:,:);
F(end-nx:end,:,:) = A(end-nx:end,:,:);
F(nx+1:end-nx,nx+1:end-ny,:) = 0;
for x=1+nx:l-nx
    for y=1+ny:w-ny
            for z=1:3
                for x1=1:length(f(1,:))
                    for y1 = 1:length(f(:,1))
                        F(x,y,z)=F(x,y,z)+f(x1,y1)*A(x-nx+x1-1,y-ny+y1-1,z);
                    end
                end
            end
    end
end
end
                    

