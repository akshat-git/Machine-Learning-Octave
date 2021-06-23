%=====================================================================
% Takes a function and inserts commas for the thousands separators.
function [commaFormattedString] = CommaFormat(value)
	try
		% Split into integer part and fractional part.
		[integerPart, decimalPart]=strtok(num2str(value),'.'); 
		% Reverse the integer-part string.
		integerPart=integerPart(end:-1:1); 
		% Insert commas every third entry.
		integerPart=[sscanf(integerPart,'%c',[3,inf])' ... 
				repmat(',',ceil(length(integerPart)/3),1)]'; 
		integerPart=integerPart(:)'; 
		% Strip off any trailing commas.
		integerPart=deblank(integerPart(1:(end-1)));
		% Piece the integer part and fractional part back together again.
		commaFormattedString = [integerPart(end:-1:1) decimalPart];
	catch ME
		errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
			ME.stack(1).name, ME.stack(1).line, ME.message);
		set(handles.txtInfo, 'String', errorMessage);
		WarnUser(errorMessage);
	end
	return;
