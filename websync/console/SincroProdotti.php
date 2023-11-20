<?php namespace Tecnotrade\Websync\Console;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;
use Tecnotrade\Sincro\Models\SincrorRaggruppamenti;
use Tecnotrade\Sincro\Models\SincroClassi as SincroClassi;
use OFFLINE\Mall\Models\Category as MallCategory;
use OFFLINE\Mall\Models\Tax as Tax;
use OFFLINE\Mall\Models\Price as Price;
use OFFLINE\Mall\Models\Currency as Currency;
use OFFLINE\Mall\Models\Product as MallProduct;
use System\Models\File as ModelFile;
use Offline\Mall\Models\ImageSet as ImageSet;
use Str;
use DB;

class SincroProdotti extends Command
{

    /* @var string signature for the console command.
    */
    protected $signature = 'websinc:sincroprodotti';

    /**
     * @var string description is the console command description
     */
    protected $description = 'Importa Prodotti Da Api - Step 1';


    public function handle()
    {
        
    }
}