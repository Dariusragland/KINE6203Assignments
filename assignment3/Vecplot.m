function Vecplot(Vector1, Vector2)
    % Vecplot - This function Vecplot takes two vectors and plots them
    % accordingly.
    % Inputs: 
    %   Vector1 - X-axis data points
    %   Vector2 - Y-axis data points
    % Output:
    %   A plot of Vector1 vs Vector2

    % Create the plot
    plot(Vector1, Vector2);

    % Add title and axis labels
    title('Plot Title');             % Add a title for the plot
    xlabel('X-axis Label');          % Add a label for the x-axis
    ylabel('Y-axis Label');          % Add a label for the y-axis
end
