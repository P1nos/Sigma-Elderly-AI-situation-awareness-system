package com.image;

public class ImageData {
    private int num;
    private String id;
    private String filetime;
    private byte[] image;

    public ImageData(int num, String id, String filetime, byte[] image) {
        this.num = num;
        this.id = id;
        this.filetime = filetime;
        this.image = image;
    }

    public int getNum() {
        return num;
    }

    public String getId() {
        return id;
    }

    public String getFiletime_days() {
       String input = filetime;
       
       String year = input.substring(0, 4);
        String month = input.substring(4, 6);
        String day = input.substring(6, 8);


        return year + "년 " + month + "월 " + day + "일";
    }
    public String getFiletime_times() {
        String input = filetime;
        
         String hour = input.substring(8, 10);
         String minute = input.substring(10, 12);
         String second = input.substring(12, 14);

         return hour + "시 " + minute + "분 " + second + "초";
     }

    public byte[] getImage() {
        return image;
    }
    
    
}
