% Tic-Tac-Toe Game
% Darius Ragland
% 9/5/2024
% Description: I've created a very simple game of Tic-Tac-Toe where the user plays against the computer. 
% The game will go until there is a winner or there are no moves available. At the end of the game, 
% the user will be prompted to play again after each game.

play_again = true;  % Initialize flag to replay the game

while play_again
    disp('Welcome to Tic Tac Toe!');
    
    % Reset the game board
    board = zeros(3,3);  % 0 = empty, 1 = user (X), 2 = computer (O)
    
    % Draw the Game Board
    figure('Position', [100, 100, 600, 600]);  % Create Game Board
    color1 = [89, 42, 138] / 255;  % Convert ECU Purple
    color2 = [253, 200, 47] / 255; % Convert ECU Gold
    plot([.5 3.5],[-1.5 -1.5], 'k','linewidth',4,'Color',color1);
    hold on
    plot([.5 3.5],[-2.5 -2.5], 'k','linewidth',4,'Color',color1);
    plot([1.5 1.5],[-.5 -3.5], 'k','linewidth',4,'Color',color1);
    plot([2.5 2.5],[-.5 -3.5], 'k','linewidth',4,'Color',color1);
    hold off
    axis off
    title('TIC TAC TOE', 'FontSize', 30, 'FontWeight', 'normal', 'Color', color2, 'BackgroundColor', color1);
    
%% 

    % Initialize flags for the game loop
    game_over = false;
    player_turn = true;  % User goes first

    while ~game_over
        if player_turn
            % User's move
            row = input('Enter row (1-3): ');
            col = input('Enter column (1-3): ');
            
            % Check if input is within range
            if row < 1 || row > 3 || col < 1||col > 3
                disp('Try Again! Please enter a value between 1 and 3');
            elseif board(row, col) ~= 0
                disp('Try Again! This spot is already taken');
        
            else
                board(row, col) = 1;  % User marks X (1)
                place_mark(row, col, 'X');  % Plot X on the grid
                player_turn = false;   % Switch to computer's turn
           
            end
        else
            % Computer's move (random available spot)
            [availableRows, availableCols] = find(board == 0);  % Find all empty spots
            if isempty(availableRows)
                break;  % If no empty spots, it's a draw
            end
            randomSpotIndex = randi(length(availableRows));  % Choose a random empty spot
            board(availableRows(randomSpotIndex), availableCols(randomSpotIndex)) = 2;  % Computer marks O (2)
            place_mark(availableRows(randomSpotIndex), availableCols(randomSpotIndex), 'O');  % Plot O on the grid
            player_turn = true;  % Switch back to user's turn
        end

        % Check for a winner or a full board
        if check_winner(board, 1)
           text(1.35,-1.75,'You Win!','FontSize',100,'FontWeight','bold','Color','green');
            game_over = true;
        elseif check_winner(board, 2)
           text(1, -2, 'Computer Wins!', 'FontSize', 80, 'FontWeight', 'bold', 'Color', 'red');
            game_over = true;
        elseif all(board(:) ~= 0)
              text(1.35, -1.75, 'It''s a Draw!', 'FontSize', 80, 'FontWeight', 'bold', 'Color', 'cyan');
            game_over = true;
        end
    end

    % Ask the user if they want to play again
    play_response = input('Do you want to play again? (y/n): ', 's');
    if lower(play_response) == 'n'
        play_again = false;
        disp('Thanks for playing!');
        close all;  % Close figure windows
    else
        close all;  % Close previous figure before starting new game
    end
end

%% Functions

% Function to display the Tic-Tac-Toe board by plotting X or O on the grid
function place_mark(row, col, mark)
    x_coords = [1, 2, 3];  % X coordinates for columns
    y_coords = [-1, -2, -3];  % Y coordinates for rows

    if contains(mark, 'X')
        % Plot an X at the center of the cell
        text(x_coords(col), y_coords(row), 'X', 'FontSize', 40, 'HorizontalAlignment', 'center');
    elseif contains(mark, 'O')
        % Plot an O at the center of the cell
        text(x_coords(col), y_coords(row), 'O', 'FontSize', 40, 'HorizontalAlignment', 'center');
    end
    drawnow;  % Update the figure immediately
end

% Function to check if a player has won
function winner = check_winner(board, player)
    winner = false;  % Assume no winner initially
    % Check each row
    for i = 1:3
        if board(i, 1) == player && board(i, 2) == player && board(i, 3) == player
            winner = true;
            return;  % Stop checking further if we find a winner
        end
  
    % Check each column
        if board(1, i) == player && board(2, i) == player && board(3, i) == player
            winner = true;
            return;  % Stop checking further if we find a winner
        end
    end

    % Check the main diagonal (top-left to bottom-right)
    if board(1, 1) == player && board(2, 2) == player && board(3, 3) == player
        winner = true;
        return;  % Stop checking further if we find a winner
    end

    % Check the anti-diagonal (top-right to bottom-left)
    if board(1, 3) == player && board(2, 2) == player && board(3, 1) == player
        winner = true;
        return;  % Stop checking further if we find a winner
    end
end