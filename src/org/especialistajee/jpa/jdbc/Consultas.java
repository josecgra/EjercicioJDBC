package org.especialistajee.jpa.jdbc;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consultas {
	// TODO Declarar la conexion
	
	public Consultas() throws SQLException, ClassNotFoundException {
		// TODO Crear la conexion
	}
	
	public void listaVuelos () throws SQLException {
		// TODO Muestra listado de vuelos
		
	}
	
	
	public void consultaHoteles () throws SQLException {
		Integer auxInt;
		int opc=10;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// TODO Crear la sentencia y realizar la consulta
		ResultSet rs = null;
		
		try {
			if (!rs.next()) {
				System.out.println("No existen datos!.\nPulse una tecla para continuar.");
				br.readLine();
				return;
			}
		}
		catch (Exception e) {System.out.println(e);}
	}
		
	public void close () throws SQLException { // TODO Cerrar la conexion
	}

	
	public static void main(String [] args) {
		Consultas cons=null;
		
		try {
			cons=new Consultas();
			cons.listaVuelos();
			// TODO Descomentar para el ejercicio de consulta de hoteles
			// cons.consultaHoteles();
		}
		catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver no encontrado: " + e.getMessage());
		} finally {
			if(cons!=null) {
				try {
					cons.close();
				} catch (SQLException e) {}				
			}			
		}
	}
}
