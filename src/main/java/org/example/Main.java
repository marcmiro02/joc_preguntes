package org.example;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Random;
/**
 *
 * @author Marc Miró i Martí Gassó
 */
public class Main {
    static final String DB_URL = "jdbc:mysql://sql.freedb.tech:3306/freedb_joc_preguntes";
    static final String USER = "freedb_Anselmejadors";
    static final String PASS = "eqjBkueAaX&TyW7";

    public static void main(String[] args) throws SQLException, InterruptedException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        System.out.println("Estem connectats a la BBDD!\n");
        Thread.sleep(2000);

        iniciJoc();

        int idHost = iniciSessioFinal();

        System.out.println("------------------------------------------------");
        System.out.println("MENÚ:");
        System.out.println("1. Començar a jugar\n2. Consultar les estadístiques\n3. Sortir");
        System.out.println("------------------------------------------------");
        System.out.print("La teva elecció és: ");
        String resposta = S.nextLine();

        while (!resposta.equals("3")) {

            boolean jocActiu = true;

            if (resposta.equals("1")) {

                while (jocActiu) {

                    int[] arrayUsuaris = modeJoc();

                    int idModeJoc = arrayUsuaris[0];

                    int idPartida = Partida(idModeJoc);

                    int idDificultat = getDificutat();

                    if (idModeJoc == 1) {

                        int idGuest = arrayUsuaris[1];

                        int idInformacio = getInformacioPartida(idHost, idPartida);
                        int idInformacio1 = getInformacioPartida(idGuest, idPartida);

                        int puntuacioHost = 0;
                        int puntuacioGuest = 0;

                        String nomHost = "";
                        String nomGuest = "";

                        String obtenirNomHost = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomHost = conn.prepareStatement(obtenirNomHost);
                        pstmtNomHost.setInt(1, idHost);
                        ResultSet rs = pstmtNomHost.executeQuery();

                        if(rs.next()){
                            nomHost = rs.getString("nickname");
                        }

                        String obtenirNomGuest = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomGuest = conn.prepareStatement(obtenirNomGuest);
                        pstmtNomGuest.setInt(1, idGuest);
                        ResultSet rs1 = pstmtNomGuest.executeQuery();

                        if(rs1.next()){
                            nomGuest = rs1.getString("nickname");
                        }

                        for (int i = 0; i < 20; i++) {

                            if (i % 2 == 0) {

                                System.out.println("\nTORN DE: " + nomHost);
                                int[] arrayPregunta = getPreguntesRespostes(idHost, idDificultat);
                                insertarInformacioPartida(idHost, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?"; // no apareixen totes les preguntes, nomes una a la BBDD.
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioHost = puntuacioHost + 50;

                                }

                            } else {

                                System.out.println("\nTORN DE: " + nomGuest);
                                int[] arrayPregunta = getPreguntesRespostes(idGuest, idDificultat);
                                insertarInformacioPartida(idGuest, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?"; // no apareixen totes les preguntes, nomes una a la BBDD.
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio1);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioGuest = puntuacioGuest + 50;

                                }
                            }
                        }

                        if (puntuacioHost > puntuacioGuest) {

                            System.out.println("VICTÒRIA PER: " + nomHost);
                            System.out.println();

                        }

                        else if (puntuacioHost < puntuacioGuest) {

                            System.out.println("VICTÒRIA PER: " + nomGuest);
                            System.out.println();

                        }

                        else {

                            System.out.println("EMPAT ENTRE " + nomHost + " I " + nomGuest);
                            System.out.println();

                        }

                        getPuntuacio(puntuacioHost, idHost, idPartida);
                        getPuntuacio(puntuacioGuest, idGuest, idPartida);

                        String puntuacioEstadistiquesHost = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt = conn.prepareStatement(puntuacioEstadistiquesHost);
                        pstmt.setInt(1, puntuacioHost);
                        pstmt.setInt(2, idHost);
                        pstmt.executeUpdate();

                        String puntuacioEstadistiquesGuest = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt1 = conn.prepareStatement(puntuacioEstadistiquesGuest);
                        pstmt1.setInt(1, puntuacioGuest);
                        pstmt1.setInt(2, idGuest);
                        pstmt1.executeUpdate();

                    } else {

                        int idGuest1 = arrayUsuaris[1];
                        int idGuest2 = arrayUsuaris[2];
                        int idGuest3 = arrayUsuaris[3];

                        int idInformacio = getInformacioPartida(idHost, idPartida);
                        int idInformacio1 = getInformacioPartida(idGuest1, idPartida);
                        int idInformacio2 = getInformacioPartida(idGuest2, idPartida);
                        int idInformacio3 = getInformacioPartida(idGuest3, idPartida);

                        int puntuacioHost = 0;
                        int puntuacioGuest1 = 0;
                        int puntuacioGuest2 = 0;
                        int puntuacioGuest3 = 0;

                        String nomHost = "";
                        String nomGuest1 = "";
                        String nomGuest2 = "";
                        String nomGuest3 = "";

                        String obtenirNomHost = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomHost = conn.prepareStatement(obtenirNomHost);
                        pstmtNomHost.setInt(1, idHost);
                        ResultSet rs = pstmtNomHost.executeQuery();

                        if(rs.next()){
                            nomHost = rs.getString("nickname");
                        }

                        String obtenirNomGuest1 = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomGuest1 = conn.prepareStatement(obtenirNomGuest1);
                        pstmtNomGuest1.setInt(1, idGuest1);
                        ResultSet rs1 = pstmtNomGuest1.executeQuery();

                        if(rs1.next()){
                            nomGuest1 = rs1.getString("nickname");
                        }

                        String obtenirNomGuest2 = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomGuest2 = conn.prepareStatement(obtenirNomGuest2);
                        pstmtNomGuest2.setInt(1, idGuest2);
                        ResultSet rs2 = pstmtNomGuest2.executeQuery();

                        if(rs2.next()){
                            nomGuest2 = rs2.getString("nickname");
                        }

                        String obtenirNomGuest3 = "SELECT nickname FROM usuari WHERE id = ?";
                        PreparedStatement pstmtNomGuest3 = conn.prepareStatement(obtenirNomGuest3);
                        pstmtNomGuest3.setInt(1, idGuest3);
                        ResultSet rs3 = pstmtNomGuest3.executeQuery();

                        if(rs3.next()){
                            nomGuest3 = rs3.getString("nickname");
                        }

                        int comptador = 0;
                        int suma = 0;
                        for (int i = 0; i < 20; i++) {

                            if (suma == 4) {
                                comptador = i;
                                suma = 0;
                            }
                            if (i == comptador) {

                                System.out.println("\nTORN DE: " + nomHost);
                                int[] arrayPregunta = getPreguntesRespostes(idHost, idDificultat);
                                insertarInformacioPartida(idHost, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?";
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioHost = puntuacioHost + 50;

                                }

                                suma++;

                            } else if (i == comptador + 1) {

                                System.out.println("\nTORN DE: " + nomGuest1);
                                int[] arrayPregunta = getPreguntesRespostes(idGuest1, idDificultat);
                                insertarInformacioPartida(idGuest1, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?"; // no apareixen totes les preguntes, nomes una a la BBDD.
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio1);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioGuest1 = puntuacioGuest1 + 50;

                                }

                                suma++;

                            } else if (i == comptador + 2) {

                                System.out.println("\nTORN DE: " + nomGuest2);
                                int[] arrayPregunta = getPreguntesRespostes(idGuest2, idDificultat);
                                insertarInformacioPartida(idGuest2, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?"; // no apareixen totes les preguntes, nomes una a la BBDD.
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio2);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioGuest2 = puntuacioGuest2 + 50;

                                }

                                suma++;

                            } else {

                                System.out.println("\nTORN DE: " + nomGuest3);
                                int[] arrayPregunta = getPreguntesRespostes(idGuest3, idDificultat);
                                insertarInformacioPartida(idGuest3, idPartida, arrayPregunta[0]);

                                String assignarIdPregunta = "UPDATE informacio_partida SET ID_pregunta = ? WHERE id_informacio = ?"; // no apareixen totes les preguntes, nomes una a la BBDD.
                                PreparedStatement pstmt = conn.prepareStatement(assignarIdPregunta);
                                pstmt.setInt(1, arrayPregunta[0]);
                                pstmt.setInt(2, idInformacio3);
                                pstmt.executeUpdate();

                                if (arrayPregunta[1] == 1) {

                                    puntuacioGuest3 = puntuacioGuest3 + 50;

                                }

                                suma++;
                            }
                        }

                        if (puntuacioHost > puntuacioGuest1 && puntuacioHost > puntuacioGuest2 && puntuacioHost > puntuacioGuest3) {
                            System.out.println("VICTÒRIA PER: " + nomHost);
                            System.out.println();
                        } else if (puntuacioGuest1 > puntuacioHost && puntuacioGuest1 > puntuacioGuest2 && puntuacioGuest1 > puntuacioGuest3) {
                            System.out.println("VICTÒRIA PER: " + nomGuest1);
                            System.out.println();
                        } else if (puntuacioGuest2 > puntuacioHost && puntuacioGuest2 > puntuacioGuest1 && puntuacioGuest2 > puntuacioGuest3) {
                            System.out.println("VICTÒRIA PER: " + nomGuest2);
                            System.out.println();
                        } else if (puntuacioGuest3 > puntuacioHost && puntuacioGuest3 > puntuacioGuest1 && puntuacioGuest3 > puntuacioGuest2) {
                            System.out.println("VICTÒRIA PER: " + nomGuest3);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest1 && puntuacioHost == puntuacioGuest2 && puntuacioHost == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE TOTS ELS JUGADORS");
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest1 && puntuacioHost == puntuacioGuest2) {
                            System.out.println("EMPAT ENTRE " + nomHost + ", " + nomGuest1 + " I " + nomGuest2);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest1 && puntuacioHost == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE " + nomHost + ", " + nomGuest1 + " I " + nomGuest3);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest2 && puntuacioHost == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE " + nomHost + ", " + nomGuest2 + " I " + nomGuest3);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest1) {
                            System.out.println("EMPAT ENTRE " + nomHost + " I " + nomGuest1);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest2) {
                            System.out.println("EMPAT ENTRE " + nomHost + " I " + nomGuest2);
                            System.out.println();
                        } else if (puntuacioHost == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE " + nomHost + " I " + nomGuest3);
                            System.out.println();
                        } else if (puntuacioGuest1 == puntuacioGuest2) {
                            System.out.println("EMPAT ENTRE " + nomGuest1 + " I " + nomGuest2);
                            System.out.println();
                        } else if (puntuacioGuest1 == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE " + nomGuest1 + " I " + nomGuest3);
                            System.out.println();
                        } else if (puntuacioGuest2 == puntuacioGuest3) {
                            System.out.println("EMPAT ENTRE " + nomGuest2 + " I " + nomGuest3);
                            System.out.println();
                        } else {
                            System.out.println("EMPAT ENTRE TOTS ELS JUGADORS");
                            System.out.println();
                        }

                        getPuntuacio(puntuacioHost, idHost, idPartida);
                        getPuntuacio(puntuacioGuest1, idGuest1, idPartida);
                        getPuntuacio(puntuacioGuest2, idGuest2, idPartida);
                        getPuntuacio(puntuacioGuest3, idGuest3, idPartida);

                        String puntuacioEstadistiquesHost = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt = conn.prepareStatement(puntuacioEstadistiquesHost);
                        pstmt.setInt(1, puntuacioHost);
                        pstmt.setInt(2, idHost);
                        pstmt.executeUpdate();

                        String puntuacioEstadistiquesGuest1 = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt1 = conn.prepareStatement(puntuacioEstadistiquesGuest1);
                        pstmt1.setInt(1, puntuacioGuest1);
                        pstmt1.setInt(2, idGuest1);
                        pstmt1.executeUpdate();

                        String puntuacioEstadistiquesGuest2 = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt2 = conn.prepareStatement(puntuacioEstadistiquesGuest2);
                        pstmt2.setInt(1, puntuacioGuest2);
                        pstmt2.setInt(2, idGuest2);
                        pstmt2.executeUpdate();

                        String puntuacioEstadistiquesGuest3 = "UPDATE estadistiques_usuari SET punts = punts + ? WHERE id_usuari = ?";
                        PreparedStatement pstmt3 = conn.prepareStatement(puntuacioEstadistiquesGuest3);
                        pstmt3.setInt(1, puntuacioGuest3);
                        pstmt3.setInt(2, idGuest3);
                        pstmt3.executeUpdate();

                    }
                    System.out.println("Vols tornar a jugar? [S/N]");
                    String respostaJocNou = S.nextLine();

                    if (respostaJocNou.equals("s") || respostaJocNou.equals("S")) {
                        System.out.println("\nOLE LOS CARACOLES!!!!\n");

                    } else if (respostaJocNou.equals("n") || respostaJocNou.equals("N")) {
                        resposta = "3";
                        break;

                    } else {
                        System.out.println("Opció no vàlida.");
                        Thread.sleep(200);
                        System.out.println("Sortint...");
                        resposta = "3";
                        break;
                    }
                }

            } else if (resposta.equals("2")) {

                String estadistiquesQuery = "SELECT preguntes_encertades, preguntes_fallades, punts FROM estadistiques_usuari WHERE id_usuari = ? ";
                PreparedStatement pstmt = conn.prepareStatement(estadistiquesQuery);
                pstmt.setInt(1, idHost);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {

                    int pEncertades = rs.getInt("preguntes_encertades");
                    int pFallades = rs.getInt("preguntes_fallades");
                    int punts = rs.getInt("punts");

                    System.out.println();
                    System.out.println("------------------------------------------------");
                    System.out.println("Punts: " + punts);
                    System.out.println("Preguntes encertades: " + pEncertades);
                    System.out.println("Preguntes fallades: " + pFallades);
                    System.out.println("------------------------------------------------");
                    System.out.println();

                    resposta = "1";

                    Thread.sleep(3000);
                    System.out.println("Ara que ja has vist les estadístiques, anem a jugar:\n");
                }
            } else {
                System.out.println("Això no és cap opció.");
                System.out.println("Introdueix-ne una de vàlida:");
                resposta = S.nextLine();
            }
        }
    }

    //PRESENACIÓ DEL JOC
    private static void iniciJoc() throws InterruptedException {

        Scanner S = new Scanner(System.in);
        System.out.print("P");
        Thread.sleep(100);
        System.out.print("R");
        Thread.sleep(100);
        System.out.print("E");
        Thread.sleep(100);
        System.out.print("G");
        Thread.sleep(100);
        System.out.print("U");
        Thread.sleep(100);
        System.out.print("N");
        Thread.sleep(100);
        System.out.print("T");
        Thread.sleep(100);
        System.out.print("E");
        Thread.sleep(100);
        System.out.print("S");
        Thread.sleep(100);
        System.out.print(" ");
        Thread.sleep(100);
        System.out.print("P");
        Thread.sleep(100);
        System.out.print("I");
        Thread.sleep(100);
        System.out.print("P");
        Thread.sleep(100);
        System.out.print("O");
        Thread.sleep(100);
        System.out.print("L");
        Thread.sleep(100);
        System.out.print("I");
        Thread.sleep(100);
        System.out.print("A");
        Thread.sleep(100);
        System.out.print("N");
        Thread.sleep(100);
        System.out.print("E");
        Thread.sleep(100);
        System.out.println("S");
        Thread.sleep(2000);

        System.out.println("\nMOLT BON DIA TINGUIN ANSELMOS!\n");
        Thread.sleep(2000);
        System.out.println("Esteu preparats per jugar al Joc de les preguntes Pipolianes? [S/N]");
        String resposta = S.nextLine();

        if(resposta.equals("s") || resposta.equals("S")){
            System.out.println("\nDONCS COMENCEM!\n");
        }
        else if(resposta.equals("n") || resposta.equals("N")){
            System.out.println("\nDONCS MALA SORT, PERQUÈ JUGARÀS IGUAL JIJIJIJAAAA\n");
        }
        else {
            System.out.println("No has dit ni SI ni NO, per tant...\n");
            Thread.sleep(1500);
            System.out.println("A JUGAAAAAR!\n");
        }

        System.out.print("Comencem en: ");
        for (int i = 3; i >= 1; i--) {
            if(i == 1){
                System.out.println(i + "...\n");
                Thread.sleep(1000);
            }
            else {
                System.out.print(i);
                Thread.sleep(1000);
                System.out.print("\b");
            }
        }
        System.out.println("JAAAAAAAAA!\n");
        Thread.sleep(2500);

    }

    //RETORNA UN ID DE L'USUARI. UTILITZA REGISTRE() I INICISESSIO()
    private static int iniciSessioFinal() throws SQLException, InterruptedException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        System.out.println("Anem a iniciar sessio:");
        Thread.sleep(1500);
        System.out.println("Ets un jugador nou o existent?");
        Thread.sleep(1500);
        System.out.println("1. Nou\n2. Existent");

        boolean correcta = false;
        System.out.print("La teva elecció és: ");
        String resposta = S.nextLine();

        while (!correcta) {

            if (resposta.equals("1")) {

                correcta = true;

                Registre();
                System.out.println("Ara, has d'iniciar sessió:\n");
                int idUsuari = iniciSessio();

                if(correcta){
                    return idUsuari;
                }

            } else if (resposta.equals("2")) {

                correcta = true;

                int idUsuari = iniciSessio();

                if(correcta){
                    return idUsuari;
                }

            } else {
                System.out.println("Opció no vàlida. Torna a introduir la resposta:");
                resposta = S.nextLine();
            }
        }
        return 0;
    }

    //REGISTRA UN USUARI NOU
    private static void Registre() throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        System.out.println("Introdueix el teu nickname:");
        String nickname = S.nextLine();
        System.out.println("Introdueix el teu email:");
        String email = S.nextLine();
        System.out.println("Introdueix la contrasenya:");
        String contrasenya = S.nextLine();
        System.out.println("Introdueix el teu país:");
        String pais = S.nextLine();
        System.out.println("Introdueix el teu telèfon:");
        String telefon = S.nextLine();

        String introduirUsuari = "INSERT INTO usuari (nickname, correu, contrasenya, país, telefon) VALUES (?,?,?,?,?)";

        PreparedStatement pstmt = conn.prepareStatement(introduirUsuari, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, nickname);
        pstmt.setString(2, email);
        pstmt.setString(3, contrasenya);
        pstmt.setString(4, pais);
        pstmt.setString(5, telefon);

        int filasAfectadas = pstmt.executeUpdate();

        if (filasAfectadas > 0) {

            ResultSet generatedKeys = pstmt.getGeneratedKeys();

            if (generatedKeys.next()) {

                int idUsuario = generatedKeys.getInt(1);

                int idEstadistica = obtenirIdEstadistica();

                String introduirEstadistica = "INSERT INTO estadistiques_usuari (id_usuari, id_estadistica, preguntes_encertades, preguntes_fallades, punts) VALUES (?,?,0,0,0)";

                PreparedStatement pstmtEstadistica = conn.prepareStatement(introduirEstadistica);
                pstmtEstadistica.setInt(1, idUsuario);
                pstmtEstadistica.setInt(2, idEstadistica);

                int filasAfectadasEstadistica = pstmtEstadistica.executeUpdate();

                if (filasAfectadasEstadistica > 0) {
                    System.out.println("\nRegistre exitós a la BBDD. ID de l'usuari: " + idUsuario);

                } else {
                    System.out.println("No s'ha pogut realitzar el registre de l'estadística a la BBDD.");
                }
            }
        } else {
            System.out.println("No s'ha pogut realitzar el registre de l'usuari a la BBDD.");
        }
    }

    //SERVEIX PER REGISTRE
    private static int obtenirIdEstadistica() throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String query = "SELECT MAX(id_estadistica) AS max_id FROM estadistiques_usuari";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        if (rs.next()) {
            return rs.getInt("max_id") + 1;
        } else {
            // Si no hi ha registres a la taula, comencem des de l'1.
            return 1;
        }
    }

    //INICIA SESSIO D'UN USUARI EXISTENT
    private static int iniciSessio() throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        boolean iniciExitos = false;

        while (!iniciExitos) {
            System.out.print("\nUsername: ");
            String nomUsuari = S.nextLine();
            System.out.print("Password: ");
            String password = S.nextLine();

            String checkUser = "SELECT id FROM usuari WHERE nickname = ? AND contrasenya = ?";
            PreparedStatement pstmt = conn.prepareStatement(checkUser);
            pstmt.setString(1, nomUsuari);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int idUsuari = rs.getInt("id");
                System.out.println("\nInici de sessió COMPLETAT!\n");
                return idUsuari;

            } else {
                System.out.println("Nom d'usuari i/o contrasenya INCORRECTES");
            }
        }
        return 0;
    }

    //RETORNA EL MODE DE JOC I L'ID DELS JUGADORS GUEST
    private static int[] modeJoc() throws SQLException, InterruptedException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        System.out.println("\n------------------------------------------------");
        System.out.println("Escull quin Mode de Joc vols jugar:");
        Thread.sleep(1500);
        System.out.println("1. 1v1\n2. 1v1v1v1");
        System.out.println("------------------------------------------------");
        System.out.print("La teva elecció és: ");
        int resposta = S.nextInt();
        int[] retornacio = new int[1];

        boolean modeCorrecte = false;
        while (!modeCorrecte) {

            if (resposta == 1 || resposta == 2) {

                modeCorrecte = true;
                String modeDeJoc = "SELECT ID_Mode FROM mode_de_joc WHERE ID_Mode = ?";
                PreparedStatement pstmt = conn.prepareStatement(modeDeJoc);
                pstmt.setInt(1, resposta);

                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {

                    int idMode = rs.getInt("ID_Mode");

                    if (idMode == 1) {

                        int[] arrayUsuaris = new int[2];

                        System.out.println("\nHas escollit el mode de joc 1.");
                        Thread.sleep(1500);
                        System.out.println("Per tant necessites que un company entri a la partida.");
                        Thread.sleep(1500);
                        System.out.println("Per tant, company:");
                        Thread.sleep(1500);
                        int idUsuari1 = iniciSessioFinal();

                        arrayUsuaris[0] = idMode; //1v1. (Mode de joc 1)
                        arrayUsuaris[1] = idUsuari1;
                        return arrayUsuaris;

                    }

                    else {

                        int[] arrayUsuaris = new int[4];

                        System.out.println("\nHas escollit el mode de joc 2.");
                        Thread.sleep(1500);
                        System.out.println("Per tant necessites que tres companys més entrin a la partida.");
                        Thread.sleep(1500);

                        arrayUsuaris[0] = idMode; //its 1v1v1v1 (Mode de joc 2)
                        int comptador = 0;

                        while (comptador != 3) {

                            System.out.println("Company número '" + comptador + "':");

                            if(comptador == 0){

                                int idUsuari1 = iniciSessioFinal();
                                arrayUsuaris[1] = idUsuari1;
                            }
                            else if(comptador == 1){

                                int idUsuari2 = iniciSessioFinal();
                                arrayUsuaris[2] = idUsuari2;
                            }
                            else {

                                int idUsuari3 = iniciSessioFinal();
                                arrayUsuaris[3] = idUsuari3;
                            }
                            comptador++;

                        }
                        return arrayUsuaris;
                    }
                }
            }

            else {
                System.out.println("No n'has escollit cap dels dos...");
                Thread.sleep(1000);
                System.out.println("Escull-ne un, susplau");
                resposta = S.nextInt();
            }
        }
        return retornacio;
    }

    //CREA UNA FILA DE PARTIDA I RETORNA L'ID
    private static int Partida(int idMode) throws SQLException, InterruptedException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String idPartidaQuery = "SELECT MAX(id_partida) AS max_id FROM partida";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(idPartidaQuery);

        int idPartida = 1; //Valor per defecte si no hi ha partides previes.

        if (rs.next()) {
            idPartida = rs.getInt("max_id") + 1;
        }

        String createPartida = "INSERT INTO partida (id_partida, id_modejoc) VALUES (?,?)";
        PreparedStatement pstmt = conn.prepareStatement(createPartida);
        pstmt.setInt(1, idPartida);
        pstmt.setInt(2, idMode);
        pstmt.executeUpdate();

        return idPartida;
    }

    //ACONSEGUEIX LA INFORMACIO SEGONS L'ID DUNA PARTIDA. REORNA L'ID
    private static int getInformacioPartida(int idUsuari, int idPartida) throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String idInformacioQuery = "SELECT MAX(id_informacio) AS max_id FROM informacio_partida";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(idInformacioQuery);

        int idInformacio = 1; //Valor per defecte si no hi ha partides previes.

        if (rs.next()) {
            idInformacio = rs.getInt("max_id") + 1;
        }

        String createPartida = "INSERT INTO informacio_partida (id_informacio, ID_usuari, id_partida) VALUES (?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(createPartida);
        pstmt.setInt(1, idInformacio);
        pstmt.setInt(2, idUsuari);
        pstmt.setInt(3, idPartida);
        pstmt.executeUpdate();

        return idInformacio;
    }

    //RETORNA LA TEMATICA D'UNA PREGUNTA
    private static int getTematica() throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        Random rand = new Random();

        int nombreAleatori = rand.nextInt(5) + 1;

        String idTematicaQuery = "SELECT id_tematica FROM tematica WHERE id_tematica = ?";
        PreparedStatement pstmt = conn.prepareStatement(idTematicaQuery);
        pstmt.setInt(1, nombreAleatori);
        ResultSet rs = pstmt.executeQuery();

        if(rs.next()){
            int idTematica = rs.getInt("id_tematica");

            String nomCategoriaQuery = "SELECT nom FROM tematica WHERE id_tematica = ?";
            PreparedStatement pstmt1 = conn.prepareStatement(nomCategoriaQuery);
            pstmt1.setInt(1, nombreAleatori);
            ResultSet rs1 = pstmt1.executeQuery();

            if(rs1.next()){
                String nomTematica = rs1.getString("nom");
                System.out.println("Temàtica: " + nomTematica);
            }
            return idTematica;
        }
        return 0;
    }

    //OBTENIM UNA PREGUNTA SEGONS LA DIFICULTAT QUE HAGUEM SELECCIONAT
    private static int getEnunciatDificultat(int dificultat) throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        int idTematica = getTematica();
        System.out.println();

        String preguntaTematicaQuery = "SELECT preguntes.id_pregunta AS id_pregunta, preguntes.enunciat " +
                "FROM preguntes " +
                "JOIN tematica ON preguntes.id_tematica = tematica.id_tematica " +
                "WHERE tematica.id_tematica = ? AND preguntes.dificultat = ? " +
                "ORDER BY RAND() " +
                "LIMIT 1";

        PreparedStatement pstmt = conn.prepareStatement(preguntaTematicaQuery);
        pstmt.setInt(1, idTematica);
        pstmt.setInt(2, dificultat);
        ResultSet rs = pstmt.executeQuery();

        if(rs.next()){

            int idPregunta = rs.getInt("id_pregunta");
            String enunciat = rs.getString("enunciat");

            System.out.println("\n" + enunciat);

            return idPregunta;

        }
        return 0;
    }

    //OBTENIM L'ID DE LA DIFICULTAT A LA QUE SERA LA PARTIDA
    private static int getDificutat() throws InterruptedException {

        Scanner S = new Scanner(System.in);

        System.out.println("\n------------------------------------------------");
        System.out.println("A quina dificultat vols jugar?");
        Thread.sleep(1200);
        System.out.println("\n1. Dificultat Baixa\n2. Dificultat Elevada");
        System.out.println("------------------------------------------------");
        System.out.print("La teva elecció és: ");
        int resposta;

        boolean respostaCorrecta = false;
        while (!respostaCorrecta) {

            if (S.hasNextInt()) {

                resposta = S.nextInt();

                if (resposta == 1) {

                    return 1;

                } else if (resposta == 2) {

                    return 2;

                } else {

                    System.out.println("No has introduït cap de les 2 opcions.");
                    System.out.println("Introdueix-ne una de les 2, siusplau:");
                    S.nextLine();
                }
            }

            else {

                System.out.println("No has introduït cap de les 2 opcions.");
                System.out.println("Introdueix-ne una de les 2, siusplau:");
                S.nextLine();
            }
        }
        return 0;
    }

    //APAREIX LA PREGUNTA I LES RESPOSTES D'UNA PREGUNTA I ARA TAMBE ACONSEGUIM DIR SI LA PREGUNTA ES ENCERTADA O FALLADA. tambe retorna l'id .
    private static int[] getPreguntesRespostes(int IdUsuari, int dificultat) throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        Scanner S = new Scanner(System.in);

        int idPregunta = getEnunciatDificultat(dificultat);
        int[] arrayPunt = new int[2];
        System.out.println();

        arrayPunt[0] = idPregunta;

        String idRespostesQuery = "SELECT id_resposta, text_resposta FROM respostes WHERE id_pregunta = ? ORDER BY RAND()";
        PreparedStatement pstmt = conn.prepareStatement(idRespostesQuery);
        pstmt.setInt(1, idPregunta);
        ResultSet rs = pstmt.executeQuery();

        // Crear un mapa para asociar las opciones mostradas al usuario con los IDs reales de las respuestas
        Map<Integer, Integer> opcionIdMap = new HashMap<>();
        int opcion = 1; // Opción mostrada al usuario
        while (rs.next()) {

            int idResposta = rs.getInt("id_resposta");
            String enunciatResposta = rs.getString("text_resposta");
            System.out.println(opcion + ". " + enunciatResposta);
            opcionIdMap.put(opcion, idResposta); // Asociar la opción mostrada con el ID real de la respuesta
            opcion++;
        }

        // Leer la respuesta del usuario
        int respostaUsuari = 0;
        boolean valida = false;
        while (!valida) {
            System.out.print("La teva resposta és: ");
            if (S.hasNextInt()) {

                respostaUsuari = S.nextInt();

                if (respostaUsuari >= 1 && respostaUsuari <= 4) {

                    valida = true;

                } else {

                    System.out.println("\nAquesta resposta no és vàlida.");
                    System.out.println("Introdueix una resposta vàlida, siusplau: \n");

                }
            } else {

                System.out.println("\nAquesta resposta no és vàlida.");
                System.out.println("Introdueix una resposta vàlida, siusplau: \n");
                S.next();
            }
        }
        // Obtener el ID real de la respuesta seleccionada por el usuario usando el mapa
        int idRespostaSeleccionada = opcionIdMap.get(respostaUsuari);

        // Verificar si la respuesta seleccionada por el usuario es la correcta
        String correctaQuery = "SELECT id_resposta FROM respostes WHERE id_pregunta = ? AND correcta = 1";
        pstmt = conn.prepareStatement(correctaQuery);
        pstmt.setInt(1, idPregunta);
        rs = pstmt.executeQuery();

        if (rs.next()) {

            int respostaCorrecta = rs.getInt("id_resposta"); // Obtener la respuesta correcta de la base de datos

            if (idRespostaSeleccionada == respostaCorrecta) {
                System.out.println("\n\nHas encertat la pregunta!\n");
                String correctaUpdate = "UPDATE estadistiques_usuari SET preguntes_encertades = preguntes_encertades + 1 WHERE id_usuari = ?";
                PreparedStatement pstmt3 = conn.prepareStatement(correctaUpdate);
                pstmt3.setInt(1 ,IdUsuari);
                pstmt3.executeUpdate();

                arrayPunt[1] = 1;


            } else {
                System.out.println("\n\nHas fallat!\n");
                String falladaUpdate = "UPDATE estadistiques_usuari SET preguntes_fallades = preguntes_fallades + 1 WHERE id_usuari=? ";
                PreparedStatement pstmt3 = conn.prepareStatement(falladaUpdate);
                pstmt3.setInt(1 ,IdUsuari);
                pstmt3.executeUpdate();

                arrayPunt[1] = 0; // No es necessari ja que el java ho fa per Default, pero per a que s'entengui.

            }
            System.out.println("------------------------------------------------");
        }
        return arrayPunt;
    }

    private static void getPuntuacio(int puntuacio, int idUsuari, int idPartida) throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        String idPuntQuery = "SELECT MAX(id_puntuacio) AS max_id FROM puntuacio";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(idPuntQuery);

        int idPuntuacio = 1; //Valor per defecte si no hi ha partides previes.

        if (rs.next()) {
            idPuntuacio = rs.getInt("max_id") + 1;
        }

        String insertarPunt = "INSERT INTO puntuacio (id_puntuacio, Puntuacio_General, Id_Usuari, id_partida) VALUES (?,?,?,?)";

        PreparedStatement pstmt = conn.prepareStatement(insertarPunt);
        pstmt.setInt(1, idPuntuacio);
        pstmt.setInt(2, puntuacio);
        pstmt.setInt(3, idUsuari);
        pstmt.setInt(4, idPartida);
        pstmt.executeUpdate();

    }

    private static void insertarInformacioPartida(int idUsuari, int idPartida, int idPregunta) throws SQLException {

        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Crear una nueva fila en informacio_partida por cada pregunta
        String createPartida = "INSERT INTO informacio_partida (ID_usuari, ID_pregunta, id_partida) VALUES (?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(createPartida);
        pstmt.setInt(1, idUsuari);
        pstmt.setInt(2, idPregunta);
        pstmt.setInt(3, idPartida);
        pstmt.executeUpdate();

    }
}