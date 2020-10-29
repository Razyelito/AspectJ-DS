import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Transaccion {
	
	pointcut success() : call(* moneyMake*(..));
	after(): success(){
		
		//Muestro mensaje de la transaccion
		System.out.println("Se ha realizado la transaccion.");
		
		//Creo o sobreescribo el archivo log.txt con la transaccion.
		File file=new File("log.txt");
		Date date=new Date();
		DateFormat f_hora = new SimpleDateFormat("hh:mm:ss");
    	String hora_s = f_hora.format(date);
		String transaction="MoneyMakeTransaction";
		String logger = transaction+" "+hora_s+"\n";
		System.out.println(logger);
		
		try(BufferedWriter bf=new BufferedWriter(new FileWriter(file,true))){
			bf.write(logger);
		}catch(IOException i){
			System.out.println(i);
		}	
	}
}
