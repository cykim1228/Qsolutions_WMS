package kr.co.qsolutions.cowork.Util;

import java.util.Base64;
import java.nio.ByteBuffer;


import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
import java.security.AlgorithmParameters;


// 계정 처리에 관련된 Class 
public class AccountControl {
	

	final static String secretKey   = "12345678901234567890123456789012"; //32bit
	String checkvalue = "";
	String userID = "";
	String userPW = "";
	String encryptPW = "";
	String cryptPW = "";
	
	//패스워드 암호화 
	public static String CryptPW(String UserPW) throws Exception {

		//암호화	
	    SecureRandom random = new SecureRandom();
	    byte bytes[] = new byte[20];
	    random.nextBytes(bytes);
	    byte[] saltBytes = bytes;


	    // Password-Based Key Derivation function 2
	    SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

	    // 70000번 해시하여 256 bit 길이의 키를 만든다.
	    PBEKeySpec spec = new PBEKeySpec(secretKey.toCharArray(), saltBytes, 70000, 256);
	    SecretKey secretKey = factory.generateSecret(spec);
	    SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");


	    // 알고리즘/모드/패딩
	    // CBC : Cipher Block Chaining Mode

	    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    cipher.init(Cipher.ENCRYPT_MODE, secret);
	    AlgorithmParameters params = cipher.getParameters();
	    // Initial Vector(1단계 암호화 블록용)

	    byte[] ivBytes = params.getParameterSpec(IvParameterSpec.class).getIV();
	    byte[] encryptedTextBytes = cipher.doFinal(UserPW.getBytes("UTF-8"));
	    byte[] buffer = new byte[saltBytes.length + ivBytes.length + encryptedTextBytes.length];
	    System.arraycopy(saltBytes, 0, buffer, 0, saltBytes.length);
	    System.arraycopy(ivBytes, 0, buffer, saltBytes.length, ivBytes.length);
	    System.arraycopy(encryptedTextBytes, 0, buffer, saltBytes.length + ivBytes.length, encryptedTextBytes.length);

	    return Base64.getEncoder().encodeToString(buffer);
	}
	
	//패스워드 복호화
	public static String EncryptPW(String EncryptUserPW) throws Exception{
		System.out.println("EncryptPW_Start"+EncryptUserPW);
	    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    ByteBuffer buffer = ByteBuffer.wrap(Base64.getDecoder().decode(EncryptUserPW));
	    byte[] saltBytes = new byte[20];
	    buffer.get(saltBytes, 0, saltBytes.length);
	    byte[] ivBytes = new byte[cipher.getBlockSize()];
	    buffer.get(ivBytes, 0, ivBytes.length);
	    byte[] encryoptedTextBytes = new byte[buffer.capacity() - saltBytes.length - ivBytes.length];
	    buffer.get(encryoptedTextBytes);

	    SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
	    PBEKeySpec spec = new PBEKeySpec(secretKey.toCharArray(), saltBytes, 70000, 256);
	    SecretKey secretKey = factory.generateSecret(spec);
	    SecretKeySpec secret = new SecretKeySpec(secretKey.getEncoded(), "AES");

	    cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(ivBytes));
	    byte[] decryptedTextBytes = cipher.doFinal(encryoptedTextBytes);

	    return new String(decryptedTextBytes);
	}
	
}
