/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sistemaadmin.entidades;

import java.math.BigDecimal;

/**
 *
 * @author migue
 */
public class Producto {
    private int Id;
    private String NombreProducto;
    private String Marca;
    private String Descripcion;
    private String Precio;
    private int top_aux;

    public Producto() {
    }

    public Producto(int Id, String NombreProducto, String Marca, String Descripcion, String Precio, int top_aux) {
        this.Id = Id;
        this.NombreProducto = NombreProducto;
        this.Marca = Marca;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.top_aux = top_aux;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombreProducto() {
        return NombreProducto;
    }

    public void setNombreProducto(String NombreProducto) {
        this.NombreProducto = NombreProducto;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }

    public int getTop_aux() {
        return top_aux;
    }

    public void setTop_aux(int top_aux) {
        this.top_aux = top_aux;
    }
}
