function B = bilinear(img, scale)
[l,w,c]=size(img);
lb= floor(scale*(l-1));
wb = floor(scale*(w-1));
B = zeros(lb, wb, 3);
for x=1:lb
    for y=1:wb
        for z=1:c
            B(x,y,z) = img(floor(x/scale)+1,floor(y/scale)+1,z)*(1-(x/scale - floor(x/scale)))*(1-(y/scale-floor(y/scale))) ...
                + img(ceil(x/scale)+1,ceil(y/scale)+1,z)*(x/scale-floor(x/scale))*(y/scale-floor(y/scale))...
                + img(floor(x/scale)+1,ceil(y/scale)+1,z)*(1-(x/scale-floor(x/scale)))*(y/scale-floor(y/scale))...
                + img(ceil(x/scale)+1,floor(y/scale)+1,z)*(x/scale-floor(x/scale))*(1-(y/scale-floor(y/scale)));
        end
    end
end
