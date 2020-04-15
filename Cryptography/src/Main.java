import java.util.*;

public class Main {

    public static void main(String[] args) {

        Map<Character, Integer> data = new LinkedHashMap<>();

        int letter = 1040;
        int number = 54;
        for (int i = 0; i < 30; i++) {

            if (number == 72) {
                number = 10;
            }

            if (letter == 1067) {
                letter = 1068;
            }
            if (letter == 1069) {
                letter = 1070;
            }

            data.put((char) letter, number);
            letter++;
            number += 2;
        }

        data.put(' ',52);

        System.out.println(data);

        Scanner scanner = new Scanner(System.in);

        System.out.println("Избери опция: \n1.Шифроване \n2.Дешифриране");
        int input = Integer.parseInt(scanner.nextLine());

        switch (input){
            case 1:
                System.out.println("Въведи текст");
                String lettersCode = scanner.nextLine().toUpperCase();
                for (int i = 0; i < lettersCode.length(); i++) {
                    System.out.print(data.get(lettersCode.charAt(i)) + " ");
                }
                break;
            case 2:
                System.out.println("Въведи числата с интервал");
                int [] numbersCode = Arrays.stream(scanner.nextLine().split(" "))
                        .mapToInt(Integer::parseInt).toArray();

                for (int i = 0; i < numbersCode.length; i++) {

                    for (Map.Entry<Character,Integer> entry : data.entrySet()){

                        if (entry.getValue().equals(numbersCode[i])){
                            System.out.print(entry.getKey());
                            break;
                        }
                    }
                }

                break;

            default:
                System.out.println("Грешен избор.");
                break;
        }


    }

}
