function  report(i,txt)

import mlreportgen.dom.*;
d = Document('report','docx'); 
open(d);
append(d,txt,'Title');
for n=1:i
    file=sprintf('result%d.png',n);
    str=sprintf('Part%d',n);
    append(d,str);
    append(d,Image(file));
end

close(d); 
rptview(d.OutputPath);