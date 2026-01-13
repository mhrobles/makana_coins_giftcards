import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Header from './components/Header'
import HomePage from './features/home/HomePage'
import RankingPage from './features/ranking/RankingPage'
import ProfilePage from './features/profile/ProfilePage'
import CoinsPage from './features/coins/CoinsPage'
import CatalogPage from './features/giftcards/CatalogPage'
import ConfirmPage from './features/giftcards/ConfirmPage'
import MyGiftcardsPage from './features/giftcards/MyGiftcardsPage'
import './App.css'

export default function App(){
  return (
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/ranking" element={<RankingPage />} />
        <Route path="/perfil" element={<ProfilePage />} />
        <Route path="/coins" element={<CoinsPage />} />
        <Route path="/giftcards/catalog" element={<CatalogPage />} />
        <Route path="/giftcards/confirm" element={<ConfirmPage />} />
        <Route path="/giftcards/mine" element={<MyGiftcardsPage />} />
      </Routes>
    </BrowserRouter>
  )
}
