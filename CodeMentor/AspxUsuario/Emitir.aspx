<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Emitir.aspx.cs" Inherits="CodeMentor.AspxUsuario.Emitir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusquedaCursos" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <style>
      
       .containerEmitir {
           max-width: 800px;
           margin: 50px auto;
           background-color: #ffffff;
           padding: 30px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
           text-align: center;
           border-radius: 10px;
       }
       h1 {
           color: #4CAF50;
           font-size: 36px;
       }
       pGracias {
           font-size: 18px;
           color: #333333;
       }
       .btnEmitir {
           background-color: #4CAF50;
           color: white;
           padding: 15px 32px;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           font-size: 16px;
           margin: 20px auto;
           cursor: pointer;
           border: none;
           border-radius: 4px;
           transition: background-color 0.3s ease;
       }
       .btnEmitir:hover {
           background-color: #45a049;
       }
       .thank-you {
           margin-top: 30px;
           font-size: 20px;
           color: #666666;
       }
       .invitation {
           margin-top: 20px;
           font-size: 18px;
           color: #333333;
       }
   </style>
 
       <div class="container containerEmitir" style="margin-top:10%;margin-bottom:11%">
           <h1>¡Felicitaciones!</h1>
           <p>Has finalizado el curso con éxito.</p>
           <asp:Button Text="Descargar" OnClick="btnEmitir_Click" CssClass="btn btnEmitir" ID="btnEmitir" runat="server" />
           <div class="thank-you">
               <p class="pGracias">¡Gracias por confiar en nosotros y completar este curso!</p>
           </div>
           <div class="invitation">
               <p class="pGracias">Te invitamos a explorar más cursos en nuestra plataforma y seguir aprendiendo.</p>
           </div>
       </div>
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
<script>
    function lanzarConfeti() {
        // Confeti en el lado izquierdo
        confetti({
            particleCount: 400,
            angle: 60,
            spread: 55,
            origin: { x: 0, y: 0.6 }
        });
        confetti({
            particleCount: 400,
            angle: 60,
            spread: 55,
            origin: { x: 0, y: 0.4 }
        });
        confetti({
            particleCount: 400,
            angle: 60,
            spread: 55,
            origin: { x: 0, y: 0.8 }
        });

        // Confeti en el lado derecho
        confetti({
            particleCount: 400,
            angle: 120,
            spread: 55,
            origin: { x: 1, y: 0.6 }
        });
        confetti({
            particleCount: 400,
            angle: 120,
            spread: 55,
            origin: { x: 1, y: 0.4 }
        });
        confetti({
            particleCount: 400,
            angle: 120,
            spread: 55,
            origin: { x: 1, y: 0.8 }
        });
    }

    function startCelebration() {
        let count = 0;
        const interval = setInterval(() => {
            lanzarConfeti();
            count++;
            if (count === 4) {
                clearInterval(interval);
            }
        }, 2000); // Intervalo de 2 segundos entre lanzamientos
    }

    window.onload = startCelebration;
</script>


</asp:Content>
