<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/MasterUsuario.Master" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="CodeMentor.AspxUsuario.Prueba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusquedaCursos" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.3/dist/confetti.browser.min.js"></script>


    <style>
        body {
            text-align: center;
            margin-top: 50px;
        }
        #btnCelebrar {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
    <asp:Button ID="btnCelebrar" runat="server" Text="¡Celebrar!" OnClientClick="lanzarConfeti(); return false;" />
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
