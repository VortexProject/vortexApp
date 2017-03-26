<?php
/**
 *  
 *
 * By: Tomas Smekal
 * Company: Memos s.r.o.
 * Date: 1.2.2016
 */


namespace App\Forms;


use Nette\Application\UI\Form;

class FormFactory {

    public function create()
    {
        /**
         * Možnost později připojit translator, zapnout globalně csrf token, aj.
         */
        return new Form();
    }

} 