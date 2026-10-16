SKAIDROJUMS
01. Sistēmas apraksts

Skripts parāda datora nosaukumu, operētājsistēmu, PowerShell versiju, datumu un procesu skaitu.

02. Procesi

Skripts atlasa 10 procesus, kas izmanto visvairāk atmiņas, un sakārto tos augošā secībā.

03. Servisi

Skripts saskaita darbojošos un apturētos servisus, izmantojot foreach un if.

04. Automātiskie servisi

Skripts atrod apturētus automātiskos servisus. Ar -WhatIf pārbauda, kurus servisus varētu palaist.

05. Kļūdas

Skripts saskaita kļūdu ierakstus System žurnālā pēdējo 48 stundu laikā un atrod biežāko kļūdu avotu.

06. Draiveri

Skripts atlasa draiverus, kuru piegādātājs nav Microsoft, un saglabā tos CSV failā.

07. Diski

Skripts parāda disku kopējo izmēru un brīvo vietu. Ja brīvās vietas ir mazāk par 10 GB, tiek parādīts brīdinājums.

08. Spooler serviss

Skripts iegūst informāciju par Spooler servisu divos veidos un salīdzina izpildes laiku.

09. Procesu lietotāji

Skripts mēģina noteikt, kurš lietotājs palaidis katru procesu. Dažiem procesiem var nebūt pieejama informācija par lietotāju.

10. Kopsavilkums

Skripts atkārtoti pārbauda procesu skaitu, servisu skaitu, kļūdu ierakstus un disku brīvo vietu.
