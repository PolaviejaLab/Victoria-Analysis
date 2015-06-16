
Ntrials = 6;

% Specifications for the overall window holding the questionnaire:
WindowLabel = 'Discontinuity Experiment Questions';
WindowSpecs(1) = 100;  % Left edge (i.e., pixels in from left edge of screen)
WindowSpecs(2) = 100;  % Bottom edge (i.e., pixels up from from bottom edge of screen)
WindowSpecs(3) = 1000;  % Width in pixels
WindowSpecs(4) = 850;  % Height in pixels

% Specifications for an instruction box that appears on the questionnaire:
% InstructionsText = 'INSTRUCTIONS:\n\nPlease answer each item by marking a number to indicate how much you agree with each statement. Answer all items even if unsure of your answer. When you have finished, check over each one to make sure you have answered them all.\n\nPlease call the experimenter if you have any questions.';
InstructionHeight = 30;  % This must be set to the height of the instruction box; use trial and error.

% Here are the labels (left to right on the form) of the Likert scale points.
ScaleLabels{1} = 'Strongly\ndisagree';
ScaleLabels{2} = '';
ScaleLabels{3} = '';
ScaleLabels{4} = 'Neutral';
ScaleLabels{5} = '';
ScaleLabels{6} = '';
ScaleLabels{7} = 'Strongly\nagree';
ScaleLabelsHeight = 65;  % This must be set to the height of the scale labels; use trial and error.
ScaleSmallestValue = 1;  % The scale values are to be numbered starting with this value.

RequireAllAnswers = 1;  % Set to 1 if all questions must be answered and 0 if some can be left blank.
MissingValue = -1;  % This is the score for any question that is not answered--only used if RequireAllAnswers is 0.

Questions{1} = 'During the experiment there were moments in which I felt as if I were looking at my own hand, rather than a virtual hand.';
Questions{2} = 'During the experiment there were moments that I felt as if the virtual hand was my hand.';
Questions{3} = 'During the experiment there were moments when it seemed like the virtual hand belonged to me.';
Questions{4} = 'During the experiment there were times when it seemed that the virtual hand was part of my body.';
Questions{5} = 'During the experiment I felt as if the virtual hand was physically resembling my real hand.';
Questions{6} = 'During the experiment there were moments when I felt like my real hand were turning virtual.';
Questions{7} = 'During the experiment there were moments that I felt I could control the virtual hand.';
Questions{8} = 'During the experiment there were moments that I felt that the movements of the virtual hand were caused by me.';
Questions{9} = 'During the experiment there were moments that I felt that the movement of my hand was turning off the lights on the table.';
Questions{10} = 'During the experiment there were times when I had the feeling of forgetting my own hand, focussing only on the movements of the virtual hand.';
Questions{11} = 'During the experiment there were moments that I felt as if the virtual hand were controlling my hand.';
Questions{12} = 'During the experiment there moments that it felt as if the virtual hand caused the movement of my hand.';
Questions{13} = 'During the experiment there were times when it seemed like my hand was in the location the virtual hand.';
Questions{14} = 'During the experiment there were times when it seemed as if the movement of my hand was located where the virtual was moving.';


QuestionWidth = 700;  % Width of the question on the form, in pixels
NQuestions = numel(Questions);
DefaultQuestionHeight = 40;   % This is a default question height in pixels that can be adjusted with trial and error.
QuestionHeights = DefaultQuestionHeight*ones(NQuestions); % Set all question heights to the default.
% To leave more or less height for particular questions, change their
% QuestionHeights here, after the default has been set.  For example,
% QuestionHeights(5) = DefaultQuestionHeight + 10;  % This leaves 10 extra pixels of height for question 10.

Likert = nan(NQuestions, Ntrials);

for i = 1:Ntrials
    InstructionsText = ['Trial number ' num2str(i)];
    Likert(:, i) = CollectLikert(WindowSpecs,WindowLabel,InstructionsText,InstructionHeight,...
        ScaleLabels,ScaleLabelsHeight, ScaleSmallestValue, ...
        Questions, QuestionWidth, QuestionHeights, RequireAllAnswers, MissingValue);
    csvwrite('answers.csv',Likert);
end
