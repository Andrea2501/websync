# WEB SYNC V 1.0.3 BETA

Plugin per sincronizzazione con sorgente dati esterne.
Attualmente in sviluppo:
Prodotti
Brand categorie

Innanzi tutto Creare Il canale di log modificando il file: public/config/logging.php. Il log della sincro si troverà nel file /storage/logs/tecnotrade_websync{date}.log

Terminata la sincro tramite api dei prodotti nella tabella di appoggio: manca paginazione



```php

//.......
//CANALE GIA' PRESENTE COME ESEMPIO
'papertrail' => [
            'driver' => 'monolog',
            'level' => 'debug',
            'handler' => Monolog\Handler\SyslogUdpHandler::class,
            'handler_with' => [
                'host' => env('PAPERTRAIL_URL'),
                'port' => env('PAPERTRAIL_PORT'),
            ],
        ],

// AGGIUNGERE IL CANALE DI WEB SYNC
'websync' => [
            'driver' => 'daily', // Utilizza il driver "daily"
            'path' => storage_path('logs/tecnotrade_websync.log'),
            'level' => 'debug',
            'days' => 15, // Specifica il periodo di rotazione in giorni, puoi decidere la dura di mantenimento del file nell filesystem
        ],
```

## Come utilizzare

Compilare per prima cosa i nomi campi sorgente dei dati esterni, se non si hanno i nomi dei campi si può utilizzare la numerazione partendo da 0 (solo csv). NON SI POSSONO UTILIZZARE ENTRAMBI.

Dopo aver compilato i campi, compilare le regole: i dati verranno presi dalle regole quindi è obbligatorio compilare le regole. Utilizzare un nome della regola ed associare i campi alla regola che verrà letta al momento dell'importazione

Terminato di compilare le regole, effettuare il BINDING delle regole hai rispettivi campi delle tabelle di appoggio. I campi delle tabelle di appoggio sono già inseriti, non si possono aggiungere nuovi campi.
Selezionare il campo della tabella d'appoggio quindi, effettuare il binding dei campi definiti nelle regole. I campi delle tabelle di appoggio hanno già definito il tipo di dato che si aspetta e che è conforme a quello che si aspetta OFFLINE MALL.

### IMPORTANTE

Le chiamate alle api prevedono parametri opzionali. I parametri opzionali devono essere aggiunti nelle configurazione e si riferiscono a:
    . nome parametro numero record per pagina
    . valore parametro numero record per pagina
    . pagina da leggere 
    . utilizzare la data di update per leggere i dati modificati solo dopo l'ultimo parametro', questo parametro deve essere aggiunto come campo delle tabelle ed associato ad un regola: il valore di questo parametro deve avere specificata la regola "campo data update". I valori delle date contenuti nei dati delle api devono essere in formato: Y-m-d I:h:s esempio 2023-10-27 23:54:00.     



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

Le api sono state relizzate secondo il modello standard e comunque più chiaro per una struttura astratta.
Riport l'esempio di una chiamata api. Attenzione: i nomi dei campi dell' oggeto contenente i valori non DEVONO CONENERE SPAZIO. Esempio: Nome Prodotto, non è valido; Nome_Prodotto è un nome valido.
I nomi dei campi possono contenere solo lettere numeri e underscore . Non POSSONO INIZIARE CON UN underscore ed è preferibile che inizino con una lettera.

Chiamata di esempio che verrà utilizzato nel codice.

```php

//funzione per ottenere il token
protected function getToken($username, $password)
    {
        $urlForToken = "https://catalogo.specialformaggi.it/services/export/login"; // url alla chiamata per ottenere il token

        //parametri che si aspetta la chiamata: username e password che vengono specificati nelle configurazioni
        $response = Http::post($urlForToken, [
            'username' => $username, 
            'password' => $password,
        ]);
        if ($response->ok()) {
            return $response->body(); 
            // risposta dalla api se va a buon fine che ci deve restituire il token es: "abcdefgh" come stringa del body e che useremo per le rimanente chimate api
        } else {
            return null;
        }
    }




protected function getArticles($token,$date)
    {
        $urlArticoli = "https://catalogo.specialformaggi.it/services/export/articoli"; //url dell'Api ai prodotti

        // parametri da passare alle api, in questo caso stiamo usando il token
        // il nome dei parametri vanno specificati nella configurazione
        $curl_post_data = [
            "token" => $token, // token è il parametro che si aspetta l'api e $token è il valore
            "dataagg"=>$date  // dataaagg è il parametro di data da cui iniziamo a leggere i dati $date è il valore  
        ];

        $data = json_encode($curl_post_data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $urlArticoli);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 1110);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json')); // ci aspettiamo sempre una risposta json
        $curl_response = curl_exec($ch);

        $result = json_decode($curl_response, true);
        if ($result && is_array($result) && count($result) > 0) {
            return $result["articoli"]; 
            // "articoi" è il nome dell'oggetto che contiene tutti recordi ottenuti dalla chiamata e va specificato nelle configurazioni
        } else {
            return null;
        }
    }

```
 

    