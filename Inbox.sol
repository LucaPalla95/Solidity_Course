pragma solidity ^0.4.17; //versione di solidity a cui il compilatore si rifarà

contract Inbox { //contract è una keyward che si comporta come una classe su PY
                 //e dopo naturalmente metto il nome con il quale chiamerò il contratto
    string public message; //quando definisco una variabile ne devo definire il tipo,
                           //chi può accedere la variabile e poi il nome (ma c'è anche altro)
                           //viene chiamata anche storage variable ed è una variabile globale
                           //che si differenzia da quelle locali all'interno delle function

    function Inbox(string initialMessage) public { //chiamata construction function, queste 
                           //funzioni vengono automaticamente chiamate quando viene chiamato
                           //il contratto e difatti hanno lo stesso nome.
        message = initialMessage;
    }

    function setMessage(string newMessage) public{ 

        message=newMessage;        
    }

    function getMessage() public view returns (string) { 
        //getMessage() è il nome della mia funzione e nella parentesi ci vanno gli argomenti
        //dopo si definisce il tipo della funzione:
        //public: tutti possono chiamare questa funzione
        //private: solo il contratto può chiamare questa funzione
        //view/costant: questa funziona ritorna dati e non modifica i dati del contratto
        //pure: la funzione non modificherà mai ne leggerà i dati del contratto
        //quando qualcuno chiama questa funzione deve inviare ether in cambio
        //returns viene utilizzato solo con le funzioni view o costant e specifica il tipo
        //di dato che voglio ritornato.
        //returns è necessario per inserire poi return. Non è comunque possibile farlo
        //quando congiuntamente modifico anche dati nel contratto.
        return message;
    }
}
//ATTENZIONE! 
//Quando vado a definire una storage variable pubblica come message, Solidity me la interpreta 
//in automatico come una funzione. Quindi la funzione getMessage è superflua in qualche modo perchè
//io ottenevo il solito risultato a gratis semplicemente chiamando message