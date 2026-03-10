/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sistemaadmin.accesoadatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sistemaadmin.entidades.Producto;
/**
 *
 * @author migue
 */
public class ProductoDAL {

    static String obtenerCampos() {
        return "p.Id, p.NombreProducto, p.Marca, p.Descripcion, p.Precio";
    }

    private static String obtenerSelect(Producto pProducto) {
        String sql;
        sql = "Select ";
        if (pProducto.getTop_aux() > 0
                && ConexionDB.TIPODB == ConexionDB.TipoDB.SQLSERVER) {
            sql += "Top " + pProducto.getTop_aux() + " ";
        }
        sql += (obtenerCampos() + " From Producto p");
        return sql;
    }

    private static String agregarOrderBy(Producto pProducto) {
        String sql = " Order by p.Id Desc";
        if (pProducto.getTop_aux() > 0
                && ConexionDB.TIPODB == ConexionDB.TipoDB.MYSQL) {
            sql += "Limit " + pProducto.getTop_aux() + " ";
        }
        return sql;
    }

    public static int crear(Producto pProducto) throws Exception {
        int result;
        String sql;
        try (Connection conn = ConexionDB.obtenerConexion();) {
            sql = "Insert Into Producto(NombreProducto, Marca, Descripcion, Precio) Values(?,?,?,?)";
            try (PreparedStatement st
                    = ConexionDB.createPreparedStatement(conn, sql);) {
                st.setString(1, pProducto.getNombreProducto());
                st.setString(2, pProducto.getMarca());
                st.setString(3, pProducto.getDescripcion());
                st.setString(4, pProducto.getPrecio());

                result = st.executeUpdate();
                st.close();
            } catch (SQLException ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }

    public static int modificar(Producto pProducto) throws Exception {
        int result;
        String sql;
        try (Connection conn = ConexionDB.obtenerConexion();) {
            sql = "UPDATE Producto SET NombreProducto = ?, Marca = ?, Descripcion = ?, Precio = ? WHERE Id = ?";
            try (PreparedStatement ps = ConexionDB.createPreparedStatement(conn, sql);) {
                ps.setString(1, pProducto.getNombreProducto());
                ps.setString(2, pProducto.getMarca());
                ps.setString(3, pProducto.getDescripcion());
                ps.setString(4, pProducto.getPrecio());;
                ps.setInt(5, pProducto.getId());
                result = ps.executeUpdate();
                ps.close();
            } catch (Exception ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }

    public static int eliminar(Producto pProducto) throws Exception {
        int result;
        String sql;
        try (Connection conn = ConexionDB.obtenerConexion();) {
            sql = "Delete From Producto Where Id = ?";
            try (PreparedStatement ps = ConexionDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pProducto.getId());
                result = ps.executeUpdate();
                ps.close();
            } catch (SQLException ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return result;
    }

    static int asignarDatosResultSet(Producto pProducto, ResultSet pResultSet, int pIndex) throws Exception {
        pIndex++;
        pProducto.setId(pResultSet.getInt(pIndex));
        pIndex++;
        pProducto.setNombreProducto(pResultSet.getString(pIndex));
        pIndex++;
        pProducto.setMarca(pResultSet.getString(pIndex));
        pIndex++;
        pProducto.setDescripcion(pResultSet.getString(pIndex));
        pIndex++;
        pProducto.setPrecio(pResultSet.getString(pIndex));
        return pIndex;
    }

    private static void obtenerDatos(PreparedStatement pPS, ArrayList<Producto> pProducto) throws Exception {
        try (ResultSet resultset = ConexionDB.obtenerResulSet(pPS);) {
            while (resultset.next()) {
                Producto producto = new Producto();
                asignarDatosResultSet(producto, resultset, 0);
                pProducto.add(producto);
            }
            resultset.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public static Producto obtenerPorId(Producto pProducto) throws Exception {
        Producto producto = new Producto();
        ArrayList<Producto> productos = new ArrayList();
        try (Connection conn = ConexionDB.obtenerConexion();) {
            String sql = obtenerSelect(pProducto);
            sql += " Where Id = ?";
            try (PreparedStatement ps = ConexionDB.createPreparedStatement(conn, sql);) {
                ps.setInt(1, pProducto.getId());
                obtenerDatos(ps, productos);
                ps.close();
            } catch (Exception ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }
        if (productos.size() > 0) {
            producto = productos.get(0);
        }
        return producto;
    }

    public static ArrayList<Producto> obtenerTodos() throws Exception {
        Producto producto = new Producto();
        ArrayList<Producto> productos = new ArrayList();
        try (Connection conn = ConexionDB.obtenerConexion();) {
            String sql = obtenerSelect(new Producto());
            sql += agregarOrderBy(new Producto());
            try (PreparedStatement ps = ConexionDB.createPreparedStatement(conn, sql);) {
                obtenerDatos(ps, productos);
                ps.close();
            } catch (Exception ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }

        return productos;
    }

    static void querySelect(Producto pProducto, ConexionDB.UtilQuery pUtilQuery) throws Exception {
        PreparedStatement statement = pUtilQuery.getStatement();
        if (pProducto.getId() > 0) {
            pUtilQuery.AgregarWhereAnd(" p.Id = ? ");
            if (statement != null) {
                statement.setInt(pUtilQuery.getNumWhere(),
                        pProducto.getId());
            }
        }

        if (pProducto.getNombreProducto() != null
                && pProducto.getNombreProducto().trim().isEmpty() == false) {
            pUtilQuery.AgregarWhereAnd(" p.NombreProducto Like ? ");
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(),
                        "%" + pProducto.getNombreProducto() + "%");
            }
        }

        if (pProducto.getMarca() != null
                && pProducto.getMarca().trim().isEmpty() == false) {
            pUtilQuery.AgregarWhereAnd(" p.Marca Like ? ");
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(),
                        "%" + pProducto.getMarca() + "%");
            }
        }

        if (pProducto.getDescripcion() != null
                && pProducto.getDescripcion().trim().isEmpty() == false) {
            pUtilQuery.AgregarWhereAnd(" p.Descripcion Like ? ");
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(),
                        "%" + pProducto.getDescripcion() + "%");
            }
        }
        
        if (pProducto.getPrecio() != null
                && pProducto.getDescripcion().trim().isEmpty() == false) {
            pUtilQuery.AgregarWhereAnd(" p.Precio Like ? ");
            if (statement != null) {
                statement.setString(pUtilQuery.getNumWhere(),
                        "%" + pProducto.getPrecio() + "%");
            }
        }
    }

    public static ArrayList<Producto> buscar(Producto pProducto) throws Exception {
        ArrayList<Producto> producto = new ArrayList();
        try (Connection conn = ConexionDB.obtenerConexion();) {
            String sql = obtenerSelect(pProducto);
            ConexionDB conexiondb = new ConexionDB();
            ConexionDB.UtilQuery utilQuery
                    = conexiondb.new UtilQuery(sql, null, 0);
            querySelect(pProducto, utilQuery);
            sql = utilQuery.getSQL();
            sql += agregarOrderBy(pProducto);
            try (PreparedStatement ps = ConexionDB.createPreparedStatement(conn, sql);) {
                utilQuery.setStatement(ps);
                utilQuery.setSQL(null);
                utilQuery.setNumWhere(0);
                querySelect(pProducto, utilQuery);
                obtenerDatos(ps, producto);
                ps.close();
            } catch (Exception ex) {
                throw ex;
            }
        } catch (SQLException ex) {
            throw ex;
        }

        return producto;
    }
}
