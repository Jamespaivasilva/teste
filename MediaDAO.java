/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;


import Classes.Media;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author logonlb
 */
public class MediaDAO {

    public String inserirDisciplina(Media aluno, String rgm) {
        String resp = "";

        try {
            Connection con = Conecta.getConexao();

            String sql1 = "SELECT * FROM medias where rgm='" + rgm + "' and disciplina='" + aluno.getDisciplina() + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);

            if (rs.next()) {

                resp = "Aluno ja possui media para essa disciplina";

            } else {
                String sql = "INSERT INTO medias (rgm, disciplina, nota) values (?,?,?)";

                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, rgm);
                ps.setString(2, aluno.getDisciplina());
                ps.setFloat(3, aluno.getMedia());

                ps.execute();

                ps.close();
                con.close();
                resp = "OK";

            }

        } catch (Exception e) {
            resp = "ERRO: " + e.toString();
        }
        return resp;
    }

    public ArrayList<Media> getMedia() {
        ArrayList<Media> lista = new ArrayList<Media>();

        try {
            Connection con = Conecta.getConexao();
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM medias";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Media aluno = new Media();
                aluno.setRgm(rs.getString("rgm"));
                aluno.setDisciplina(rs.getString("disciplina"));
                aluno.setMedia(rs.getFloat("nota"));


                lista.add(aluno);

            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    
        public ArrayList<Media> getMediaBoletim(String rgm) {
        ArrayList<Media> lista = new ArrayList<Media>();

        try {
            Connection con = Conecta.getConexao();
            Statement stmt = con.createStatement();
            String sql = "SELECT a.rgm, a.nome, m.disciplina, m.nota FROM medias m ";
            sql+="inner join alunos a on a.rgm = m.rgm where a.rgm=" + rgm;
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Media aluno = new Media();
                aluno.setNome(rs.getString("nome"));
                aluno.setRgm(rs.getString("rgm"));
                aluno.setDisciplina(rs.getString("disciplina"));
                aluno.setMedia(rs.getFloat("nota"));


                lista.add(aluno);

            }
            rs.close();
            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    

}
