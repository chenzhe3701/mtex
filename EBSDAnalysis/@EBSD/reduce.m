function ebsd = reduce(ebsd,fak)
% reduce ebsd data by a factor
% 
%
% Syntax
%   ebsd = reduce(ebsd,2) % take every second pixel horiz. and vert.
%   ebsd = reduce(ebsd,3) % take every third pixel horiz. and vert.
%
% Input
%  ebsd - @EBSD
%
% Output
%  ebsd - @EBSD
%

% generate regular grid
ext = ebsd.extend;
dx = max(ebsd.unitCell(:,1))-min(ebsd.unitCell(:,1));
dy = max(ebsd.unitCell(:,2))-min(ebsd.unitCell(:,2));

% detect position within grid
iy = round((ebsd.prop.y - ext(3))/dy);
ix = round((ebsd.prop.x - ext(1))/dx);

ebsd = ebsd.subSet(~mod(ix,fak) & ~mod(iy,fak));
ebsd.unitCell = fak*ebsd.unitCell;

end