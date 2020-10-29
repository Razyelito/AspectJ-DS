import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

public aspect Logger {
	
	pointcut success() : call(* create*(..) );
    after() : success() { 

    	//Muestro la transaccion
    	System.out.println("Se ha realizado la transaccion.");
    			
    	//Creo o sobreescribo el archivo log.txt con la transaccion.
    	File file = new File("log.txt");
    	Date date = new Date();
    	DateFormat dtformat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    	String strDate=dtformat.format(date);
    	String transaction = "CreateUser";
    	String logger = transaction +" "+ strDate+"\n";
    	
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter(file,true))){
			bf.write(logger);
		}catch(IOException i){
			System.out.println(i);
		}	
    	
    }

}
