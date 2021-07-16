/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.b1soft.util;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.CreateFolderErrorException;
import com.dropbox.core.v2.files.CreateFolderResult;
import com.dropbox.core.v2.files.DeleteResult;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.GetMetadataErrorException;
import com.dropbox.core.v2.files.LookupError;
import com.dropbox.core.v2.files.WriteMode;
import com.dropbox.core.v2.sharing.ListSharedLinksResult;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;
import java.io.ByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;

/**
 *
 * @author jordan.macias
 */
public class JavaDropBox {

  
    private static final String ACCESS_TOKEN_TEST = "7tCX9x2tNjwAAAAAAAAAAV8J5EDkecvdanJiJvbqHveWNX23BcbuN90Z201DRnQr"; //token de prueba, MODIFICAR!!

    private DbxClientV2 getClient() {
        // Create Dropbox client
        DbxRequestConfig config = DbxRequestConfig.newBuilder("B1-SOFT-RECLUTAMIENTO").build();
        DbxClientV2 client = new DbxClientV2(config, ACCESS_TOKEN_TEST);
        return client;
    }

    public void uploadToDropbox(byte[] file, String dropboxFileLocation) throws FileNotFoundException, IOException, DbxException {
        dropboxFileLocation = setFirstSlashIfNotExists(dropboxFileLocation);
        DbxClientV2 client = getClient();
        try (InputStream in = new ByteArrayInputStream(file)) {
            FileMetadata metadata = client.files().uploadBuilder(dropboxFileLocation).withMode(WriteMode.OVERWRITE).uploadAndFinish(in);
            System.out.println("[DROPBOX] Archivo subido: " + metadata.getName());
        }
    }

    public void downloadFromDropbox(String dropboxFileLocation, String destinationLocalFile) throws FileNotFoundException, IOException {
        dropboxFileLocation = setFirstSlashIfNotExists(dropboxFileLocation);
        FileOutputStream outputStream = new FileOutputStream(destinationLocalFile);
        DbxClientV2 client = getClient();
        try {
            FileMetadata metadata = client.files().downloadBuilder(dropboxFileLocation).download(outputStream);
            System.out.println("[DROPBOX] Archivo descargado: " + metadata.getName());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            outputStream.close();
        }
    }

    //////TAL VEZ SE TENGA QUE IMPLEMENTAR
    public ByteArrayOutputStream downloadFromDropbox(String dropboxFileLocation) throws FileNotFoundException, IOException {
        dropboxFileLocation = setFirstSlashIfNotExists(dropboxFileLocation);
        DbxClientV2 client = getClient();
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            FileMetadata metadata = client.files().downloadBuilder(dropboxFileLocation).download(outputStream);
            System.out.println("[DROPBOX] Archivo descargado: " + metadata.getName());
            return outputStream;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    public void deleteFileOrDirectory(String dropboxFileName) throws DbxException {
        dropboxFileName = setFirstSlashIfNotExists(dropboxFileName);
        DbxClientV2 client = getClient();
        DeleteResult deleteResult = client.files().deleteV2(dropboxFileName);
        System.out.println("[DROPBOX] Archivo borrado: " + deleteResult.getMetadata().getName());
    }

    private String setFirstSlashIfNotExists(String dropboxPath) {
        if (dropboxPath.startsWith("/")) {
            return dropboxPath;
        } else {
            return "/" + dropboxPath;
        }
    }
    
    public String createURL (String string){
         String URL = null;
        try {
            DbxClientV2 client = getClient();
            SharedLinkMetadata share = client.sharing().createSharedLinkWithSettings("/"+string);
            System.out.println(share);
            return share.getUrl();
        } catch (DbxException ex) {
            Logger.getLogger(JavaDropBox.class.getName()).log(Level.SEVERE, null, ex);
        }
        return URL;
    }
      public  ListSharedLinksResult getURL(String string) throws DbxException {
        
        DbxClientV2 client = getClient();
        ListSharedLinksResult result = client.sharing().listSharedLinksBuilder().withPath("/"+string).withDirectOnly(true).start();
        return result;
    }
      public static void main (String Args[]) throws DbxException{
         JavaDropBox delete = new JavaDropBox();
         delete.deleteFileOrDirectory("/HEMV970924EN9_Video.mp4");
         delete.deleteFileOrDirectory("/HEMV970924EN9_CV.pdf");
         delete.deleteFileOrDirectory("/HEMV970924EN9_Imagen.pdf");
      }
      
}
