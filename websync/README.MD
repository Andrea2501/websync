# WEB SYNC V 1.0 BETA

Plugin per sincronizzazione con sorgente dati esterne.
Attualmente in sviluppo:
Prodotti
Brand categorie

## Come utilizzare

Compilare per prima cosa i nomi campi sorgente dei dati esterni, se non si hanno i nomi dei campi si può utilizzare la numerazione partendo da 0. NON SI POSSONO UTILIZZARE ENTRAMBI.

Dopo aver compilato i campi, compilare le regole: i dati verranno presi dalle regole quindi è obbligatorio compilare le regole. Utilizzare un nome della regola ed associare i campi alla regola che verrà letta al momento dell'importazione

Terminato di compilare le regole, effettuare il BINDING delle regole hai rispettivi campi delle tabelle di appoggio. I campi delle tabelle di appoggio sono già inseriti, non si possono aggiungere nuovi campi.
Selezionare il campo della tabella d'appoggio quindi, effettuare il binding dei campi definiti nelle regole. I campi delle tabelle di appoggio hanno già definito il tipo di dato che si aspetta e che è conforme a quello che si aspetta OFFLINE MALL.

Sono state aggiunti i modelli e i controller per le tabelle d'appoggio con prefisso support_ per categorie, brand e prodotti
.
.
.
.

## Preparazioni model e controller per Csv e Api

Impostare le configurazioni prima di eseguire ogni importazione

## CSV

    Configurare il percorso di download dei file csv, se non verranno eseguite modifiche i file dovranno essere in /storage/app/media/websync/. Se si desidera specificare un percorso diverso e si desidera salvare in  /storage/app/media/csvfiles/, scrivere esclusivamente csvfiles.

    Specificare i nomi dei rispettivi file che verranno caricati o scaricati tramite ftp.

    Parametri: 
    Al momento in via di definizione: i file verranno caricati o direttamente nella cartella specificata o tramite ftp e verrà effettuato il chunk dei record direttamante dal codice sviluppato.

    FTP:
    Se presente un accesso ftp i file verranno scaricati nella cartella locale specificata in precedenza.
    Parametri obbligatori:
    ip del server (host):
    username
    password
    porta
    SSL obbligatorio.

    l'Ftp dovrà puntare direttamente alla cartella contenente i file csv che verranno scaricati in locale, i nomi dei file deve essere esattamente quello specificato nelle configurazioni e potranno contenere solo lettere, numeri e underscore [AZaz0-9_].csv

## API

    