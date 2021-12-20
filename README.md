# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [x64-mingw32] 

* System dependencies
  * rails ~> 6.1.4 
  * ruby '2.7.4' 
  * sqlite

* Database creation
  * bin/rails db:create

* Database initialization
  * bin/rails db:migrate 
  * bin/rails db:seed 
  
* Installation
  * execute bundle install and yarn install in root's project

##Entraga 3: 

*La entrega 2 se paso a Rails, almacenando la informacion en una base de datos*

Se creo un modelo de usuarios, para la gestion de roles y permisos se utilizaron las gemas cancan y devise respectivamente, existen tres tipos de usuarios, administracion(posee todos los permisos), consulta(Pueden leer la informacion pero no modificar) y asistencia(Pueden gestionar los turnos, altas bajas y modificaciones).
 * Se dejo cargado para una mejor prueba 3 usuarios y 3 profesionales:
   * Usuarios:
     * email: 'consulta@ttps.com', password: '142536'
     * email: 'asistencia@ttps.com', password: '142536'
     * administracion@ttps.com', password: '142536', este ultimo es el unico capaz de acceder a la administracion de los usuarios, teniendo permisos para crearlos, editarlos o eliminarlos.
   * Profesionales
     * Antonella
     * Valeria 
     * Carlos
 
Decisiones de diseño:
 * No es posible crear un turno en el pasado, se requiere que la fecha sea mayor a hoy
 * Se permiten cancelar turnos pasados para llevar una mejor organizacion del profesional y sus pacientes
 * En la descarga e las grillas si se deja vacio el campo del profesional se descargara la grilla on todos los profesionales, todo tipo de rol puede hacerlo
 * Un profesional no posee turnos solapados

 * ...
