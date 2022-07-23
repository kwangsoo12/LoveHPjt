package com.loveandheart.LH.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AES256CipherUtil {
	private static final Logger LOGGER = Logger.getLogger( AES256CipherUtil.class.getName() );
	public static String encrypt(String plainText, String key) {
		byte[] clean = plainText.getBytes();
		
		LOGGER.log(Level.INFO, "[AES256CipherUtil, encrypt] plainText : {} ", plainText );
		
		int ivSize = 16;
		byte[] iv = new byte[ivSize];
		SecureRandom random = new SecureRandom();
		random.nextBytes(iv);
		IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		
		MessageDigest digest;
		Cipher cipher;
		byte[] encrypted = null;
		try {
			digest  = MessageDigest.getInstance("SHA-256");
			digest.update(key.getBytes("UTF-8"));
			byte[] keyBytes = new byte[16];
			System.arraycopy(digest.digest(), 0, keyBytes, 0, keyBytes.length);
			SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
			
			// Encrypt
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
			
			encrypted = cipher.doFinal(clean);
		} catch (NoSuchAlgorithmException e) {
			LOGGER.log(Level.SEVERE, "NoSuchAlgorithmException: {} ", e.getMessage());
		} catch (UnsupportedEncodingException e) {
			LOGGER.log(Level.SEVERE, "UnsupportedEncodingException: {} ", e.getMessage());
		} catch (NoSuchPaddingException e) {
			LOGGER.log(Level.SEVERE, "NoSuchPaddingException: {} ", e.getMessage());
		} catch (InvalidKeyException e) {
			LOGGER.log(Level.SEVERE, "InvalidKeyException: {} ", e.getMessage());
		} catch (InvalidAlgorithmParameterException e) {
			LOGGER.log(Level.SEVERE, "InvalidAlgorithmParameterException: {} ", e.getMessage());
		} catch (IllegalBlockSizeException e) {
			LOGGER.log(Level.SEVERE, "IllegalBlockSizeException: {} ", e.getMessage());
		} catch (BadPaddingException e) {
			LOGGER.log(Level.SEVERE, "BadPaddingException: {} ", e.getMessage());
		}
		 
		if (encrypted == null) {
			LOGGER.log(Level.SEVERE, "AES256CipherUtil null ");
		}
		
		byte[] encryptedIVAndText = new byte[ivSize + encrypted.length];
		System.arraycopy(iv, 0, encryptedIVAndText, 0, ivSize);
		System.arraycopy(encrypted, 0, encryptedIVAndText, ivSize, encrypted.length);
		
		// LOGGER.log(Level.INFO, "[AES256CipherUtil encrypt] encrypedText : {}", Base64);
		return Base64.getEncoder().encodeToString(encryptedIVAndText);

	}
	
	public static String decrypt(byte[] encryptedIvTextBytes, String key) {
		int ivSize = 16;
		int keySize = 16;
		
		LOGGER.log(Level.INFO, "[AES256CipherUtil, decrypt] encryptedText : {} ", Base64.getEncoder().encodeToString(encryptedIvTextBytes));
		
		byte[] iv = new byte[ivSize];
		System.arraycopy(encryptedIvTextBytes, 0, iv, 0, iv.length);
		IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		
		int encryptedSize = encryptedIvTextBytes.length - ivSize;
		byte[] encryptedBytes = new byte[encryptedSize];
		System.arraycopy(encryptedIvTextBytes, ivSize, encryptedBytes, 0, encryptedSize);
		
		byte[] keyBytes = new byte[keySize];
		MessageDigest md;
		byte[] decrypted = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
			
			md.update(key.getBytes());
			System.arraycopy(md.digest(), 0, keyBytes, 0, keyBytes.length);
			SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
			
			Cipher cipherDecrypt = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipherDecrypt.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
			decrypted = cipherDecrypt.doFinal(encryptedBytes);
		} catch (NoSuchAlgorithmException e) {
			LOGGER.log(Level.SEVERE, "NoSuchAlgorithmException: {} ", e.getMessage());
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new String(decrypted);
	}
}