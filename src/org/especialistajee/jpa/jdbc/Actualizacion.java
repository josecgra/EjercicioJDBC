package org.especialistajee.jpa.jdbc;

import java.sql.SQLException;

public class Actualizacion {
	// TODO Declarar la conexion
	
	public Actualizacion() throws SQLException, ClassNotFoundException {
		// TODO Crear la conexion
	}
	
	public int actualizaEuros () throws SQLException{
		// TODO Realizar la actualizacion
		return 0;
	}
	
	public void close () throws SQLException { // TODO Cerrar la conexion
	}

	
	public static void main(String [] args) {
		Actualizacion cons=null;
		
		try {
			cons=new Actualizacion();
			System.out.println("Registros actualizados="+cons.actualizaEuros());
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
