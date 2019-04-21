package com.util;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageCodeUtil {
	public static int num=0;
	
	public static BufferedImage getImage() {
	      	Random r = new Random();
	        //1.����һ��bufferedimage����
	        BufferedImage image = new BufferedImage(60, 20, BufferedImage.TYPE_INT_RGB);
	        //2.���Ƴ�����
	        Graphics g = image.getGraphics();
	        g.setColor(new Color(233, 222, 220));
	        g.fillRect(0, 0, 60, 20);
	        //3.���Ƹ�����
	        for(int i = 0;i < 200;i++){
	            g.setColor(new Color(40+r.nextInt(200),40+r.nextInt(200),40+r.nextInt(200)));
	            int x = r.nextInt(50);
	            int y = r.nextInt(20);
	            g.drawLine(x,y, x+r.nextInt(20), y+r.nextInt(15));
	        }
	        //4.д��λ����
	        g.setColor(new Color(23, 22, 20));
	        int checkCode = r.nextInt(9000)+1000;
	        num=checkCode;
	        g.drawString(checkCode+"", 15, 15);
	        //�ر�Graphics�����ͷ���Դ
	        g.dispose();
	        return image;

	}
}
