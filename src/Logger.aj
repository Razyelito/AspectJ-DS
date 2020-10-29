import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Logger {
	

	pointcut success() : call(* create*(..) );

    after() : success() { 

    	//Muestro la transaccion
    	System.out.println("Se ha realizado la transaccion.");
    			
    	//Creo o sobreescribo el archivo log.txt con la transaccion.

    	File archivo = new File("log.txt");
    	Date date = new Date();
    	DateFormat f_hora = new SimpleDateFormat("hh:mm:ss");
    	String hora_s = f_hora.format(date);
    	String transaccion = "CreateUser";
    	String logger1 = transaccion +" "+ hora_s+"\n";
    	
    	try(BufferedWriter bfw = new BufferedWriter(new FileWriter(archivo,true))){
			bfw.write(logger1);

		}catch(IOException i){
			System.out.println(i);
		}	
    	
    }

}
