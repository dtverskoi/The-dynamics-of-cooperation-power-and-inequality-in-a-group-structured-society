function varargout = confplot(varargin)
%CONFPLOT Linear plot with continuous confidence/error boundaries.
%
%   CONFPLOT(X,Y,L,U) plots the graph of vector X vs. vector Y with
%   'continuous' confidence/error boundaries specified by the vectors
%   L and U.  L and U contain the lower and upper error ranges for each
%   point in Y. The vectors X,Y,L and U must all be the same length.  
%
%   CONFPLOT(X,Y,E) or CONFPLOT(Y,E) plots Y with error bars [Y-E Y+E].
%   CONFPLOT(...,'LineSpec') uses the color and linestyle specified by
%   the string 'LineSpec'.  See PLOT for possibilities.
%
%   H = CONFPLOT(...) returns a vector of line handles.
%
%   For example,
%      x = 1:0.1:10;
%      y = sin(x);
%      e = std(y)*ones(size(x));
%      confplot(x,y,e)
%   draws symmetric continuous confidence/error boundaries of unit standard deviation.
%
%   See also ERRORBAR, SEMILOGX, SEMILOGY, LOGLOG, PLOTYY, GRID, CLF, CLC, TITLE,
%   XLABEL, YLABEL, AXIS, AXES, HOLD, COLORDEF, LEGEND, SUBPLOT, STEM.
%
%     © 2002 - Michele Giugliano, PhD (http://www.giugliano.info) (Bern, Monday Nov 4th, 2002 - 19:02)
%    (bug-reports to michele@giugliano.info)
%   $Revision: 1.0 $  $Date: 2002/11/11 14:36:08 $
%                        
if (nargin<2)
 disp('ERROR: not enough input arguments!');
 return;
end % if
x = [];  y1 = [];  y2 = []; y3 = []; z11 = []; z12 = []; z21 = []; z22 = []; z31 = []; z32 = []; spec = '';
if (nargin >= 8)
  x  = varargin{1};
  y1  = varargin{2};
  y2  = varargin{3};
  y3  = varargin{4};
  z11 = y + varargin{5};
  z12 = y - varargin{5};
  z21 = y + varargin{6};
  z22 = y - varargin{6};
  z31 = y + varargin{7};
  z32 = y - varargin{7};
   spec = 'ok';
end % 
p1 = plot(x,y1,x,z11,x,z12);    YLIM = get(gca,'YLim');    delete(p1);
a1 = area(x,z11,min(YLIM)); 
hold on;
set(a1,'LineStyle','none');     set(a1,'FaceColor',[1 0.8 0.8]);
a2 = area(x,z12,min(YLIM)); 
set(a2,'LineStyle','none');     set(a2,'FaceColor',[1 1 1]);
if (~isempty(spec)),     
 spec = sprintf('p1 = plot(x,y,varargin{5}');
 for i=9:nargin,  spec = sprintf('%s,varargin{%d}',spec,i); end % for
 spec = sprintf('%s);',spec);
 eval(spec);
else                     p1 = plot(x,y1); 
end;

p2 = plot(x,y2,x,z21,x,z22);    YLIM = get(gca,'YLim');    delete(p2);
a1 = area(x,z21,min(YLIM)); 
hold on;
set(a1,'LineStyle','none');     set(a1,'FaceColor',[1 0.8 0.8]);
a2 = area(x,z22,min(YLIM)); 
set(a2,'LineStyle','none');     set(a2,'FaceColor',[1 1 1]);
if (~isempty(spec)),     
 spec = sprintf('p = plot(x,y,varargin{5}');
 for i=9:nargin,  spec = sprintf('%s,varargin{%d}',spec,i); end % for
 spec = sprintf('%s);',spec);
 eval(spec);
else                     p2 = plot(x,y1); 
end;

hold off;
%set(gca,'Layer','top','XGrid','on','YGrid','on');               
set(gca,'Layer','top');               
H = [p1,p2, a1, a2];
if (nargout>1) varargout{1} = H; end;
