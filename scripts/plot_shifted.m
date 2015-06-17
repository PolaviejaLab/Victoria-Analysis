function plot_shifted(Y, varargin)

    X = repmat(1:size(Y, 1), size(Y, 2), 1)';
    shift = repmat(linspace(-0.15, 0.15, size(Y, 2)), size(Y, 1), 1);
   
    plot(X + shift, Y, varargin{:});

end

