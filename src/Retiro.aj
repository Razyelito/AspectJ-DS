import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Retiro {

		 pointcut success() : call(* moneyWithdrawal*(..));
		 after(): success(){
		 
		  //Muestro mensaje de la transaccion
		  System.out.println("Se ha realizado la transaccion retiro.");
		  
		  //Creo o sobreescribo el archivo log.txt con la transaccion.
		  File f=new File("log.txt");
		  Date fecha = new Date();
		  DateFormat dtformat= new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		  String strDate=dtformat.format(fecha);
		  String transacción="moneyWithdrawal";
		  String logMssg=transacción+" "+strDate+"\n";
		    
		  try(BufferedWriter bf=new BufferedWriter(new FileWriter(f,true))){
		   bf.write(logMssg);
		  }catch(IOException i){
		   System.out.println(i);
		  } 
	}
}
