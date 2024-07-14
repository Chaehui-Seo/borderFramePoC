# [iOS] Border과 CornerRadius에 대한 고찰

Figma에서 Stroke(Border) 설정 시 아래 3가지 중에 위치를 지정할 수 있습니다. (Default 값은 Inside)
 - Center
 - Inside
 - Outside

| Figma Stroke 위치 설정 화면 |
| :-: |
| <img src="https://github.com/user-attachments/assets/b1e95477-24a5-45d8-9c39-569467bff063" width=250> |

| Center | Inside | Outside |
| :-: | :-: | :-: |
| <img src="https://github.com/user-attachments/assets/70c9f31d-d074-45eb-851d-8e27314ea7e3" width=300> | <img src="https://github.com/user-attachments/assets/e9a8db42-4633-40a5-a67b-461de9ca0886" width=300> | <img src="https://github.com/user-attachments/assets/617522c4-f804-4fbc-a92a-1f71b41011de" width=300> |


Swift에서 CALayer에 Border를 추가할 경우, 기본적으로 Inside로 Border가 추가되며 Center/Outside로 위치를 변경할 수 있는 옵션은 없습니다.
더불어 만약 Center/Outside Border에 CornerRadius값도 추가될 경우, Figma 작업물과 상당히 다른 결과물을 마주하게 됩니다.

<br>
이에 Inside,Center,Outside Border 모두를 디자인과 동일하게 구현하기 위해서
CGPath를 그리는 예제 프로젝트를 만들었습니다.

[관련 내용 정리한 블로그 글](https://huhuhi.tistory.com/4)
