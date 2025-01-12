# Université Toulouse III Paul Sabatier - UPSSITECH  
## Travaux Pratiques 2ASRI  
**Commande Articulaire d’un Robot Manipulateur de Type RP**

---

### **Objectif du TP**
Ce TP vise à étudier, sous MATLAB-SIMULINK, diverses stratégies de commande articulaire pour un robot manipulateur élémentaire de type RP. L'objectif est d'asservir les variables articulaires \( q_1(t) \) et \( q_2(t) \) à des lois horaires prédéfinies, en explorant des approches PD, PID, et des commandes non linéaires.

---

### **Présentation du Robot**
Le manipulateur est décrit par :
- Une liaison rotative \( L_1 \) (autour de \( z_0 \)), paramétrée par \( q_1 \).
- Une liaison prismatique \( L_2 \), paramétrée par \( q_2 \), définie comme la distance \( O_0O_3 \).

#### **Modèle Dynamique Inverse**
Le modèle dynamique inverse du robot s’exprime comme suit :
\[
\Gamma(t) = D(q(t))\ddot{q}(t) + B(q(t), \dot{q}(t)) + G(q(t))
\]
- **Matrice Dynamique** :
\[
D(q) = \begin{bmatrix}
m q_2^2 & 0 \\
0 & m
\end{bmatrix}
\]
- **Efforts Centrifuges et de Coriolis** :
\[
B(q, \dot{q}) = \begin{bmatrix}
2m q_2 \dot{q}_1 \dot{q}_2 \\
-m q_2 \dot{q}_1^2
\end{bmatrix}
\]
- **Efforts Gravitationnels** :
\[
G(q) = -\begin{bmatrix}
m q_2 g_y \cos(q_1) \\
m g_y \sin(q_1)
\end{bmatrix}
\]
Avec \( m = 15 \, \mathrm{kg} \).

#### **Modélisation des Actionneurs**
Les actionneurs, représentés par des moteurs à courant continu avec réducteurs, suivent un schéma de type :
\[
V_i(p) = K(\Theta_{mi}^*(p) - \Theta_{mi}(p)) - K_D p \Theta_{mi}(p)
\]
Les paramètres pertinents incluent \( K_m/R = 0.3 \), \( B_{\text{eff}} = 1/80 \), \( J_m = 1/100 \), et des rapports \( r \in \{1/200, 1/30, 1\} \).

---

### **Travail Réalisé**
#### **1. Prise en Main de l’Outil de Simulation**
- **Initialisation** : Chargement de la bibliothèque `lib_robotRP` sous SIMULINK. Insertion des blocs `profils_de_consigne_axes_1_et_2` et `robot_RP` dans un diagramme vierge.
- **Observation** : Analyse des profils de consigne \( q_1(t) \) et \( q_2(t) \) en fonction du temps.

#### **2. Commande en Vitesse de Type PD**
- **Synthèse de la Loi de Commande** :
  - Coefficients \( K \) et \( K_D \) calculés pour une erreur de vitesse \( \varepsilon_{1i}/\theta_{1mi} = 1/2 \).
  - Validation par simulation des réponses temporelles pour des consignes en échelon et en rampe.
- **Analyse** : Étude de la robustesse en présence de perturbations gravitationnelles et conclusions sur la validité du modèle linéaire.

#### **3. Commande en Vitesse de Type PID**
- **Optimisation** : Détermination du temps intégral \( T_I \) pour améliorer la précision sans dégrader la stabilité.
- **Simulation** : Implémentation sous SIMULINK et ajustement manuel de \( T_I \) pour des résultats optimaux.

#### **4. Commande Non Linéaire Centralisée**
- **Feedforward** : Introduction d’une loi avant via la fonction `sf_loi_avant_RP.m`. Simulations menées pour comparer l’approche avec celles précédentes.
- **Découplage** : Élaboration d’un retour linéarisant et analyse des performances en boucle fermée.

---

### **Résultats et Conclusions**
1. La commande PD offre un compromis simple et efficace, bien qu’elle soit sensible aux perturbations gravitationnelles.
2. La commande PID améliore la précision mais nécessite un ajustement minutieux pour préserver la stabilité.
3. Les approches non linéaires permettent un meilleur suivi des consignes grâce à leur capacité à intégrer directement les dynamiques complexes du système.

#### **Perspectives**
- Étendre les simulations à des scénarios plus complexes (contact avec environnement).
- Comparer les résultats obtenus avec des approches modernes comme l’asservissement par apprentissage.

---

### **Annexes**
- **Schémas Simulink** : Diagrammes détaillés des configurations PD, PID, et non linéaires.
- **Codes MATLAB** : Implémentations des fonctions `sf_loi_avant_RP.m` et `sf_retour_linearisant_RP.m`.
